import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

class HeroBoxWithAnimatedIcons extends StatefulWidget {
  final ThemeMode themeMode;
  final double size;

  const HeroBoxWithAnimatedIcons({
    Key? key,
    required this.themeMode,
    this.size = 220,
  }) : super(key: key);

  @override
  State<HeroBoxWithAnimatedIcons> createState() => _HeroBoxWithAnimatedIconsState();
}

class _HeroBoxWithAnimatedIconsState extends State<HeroBoxWithAnimatedIcons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<IconData> icons = [
    FontAwesomeIcons.android,
    FontAwesomeIcons.apple,
    FontAwesomeIcons.chrome,
    FontAwesomeIcons.windows,
    FontAwesomeIcons.flutter,
    FontAwesomeIcons.github,
    FontAwesomeIcons.fireFlameCurved

  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _calculateEdgePosition(double progress, double boxSize) {
    // progress 0.0 -> 1.0
    double perimeter = boxSize * 4; // approx rectangle loop
    double distance = perimeter * progress;

    if (distance <= boxSize) {
      return Offset(distance, 0); // top edge
    } else if (distance <= boxSize * 2) {
      return Offset(boxSize, distance - boxSize); // right edge
    } else if (distance <= boxSize * 3) {
      return Offset(boxSize - (distance - boxSize * 2), boxSize); // bottom edge
    } else {
      return Offset(0, boxSize - (distance - boxSize * 3)); // left edge
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.themeMode == ThemeMode.dark;
    final Color boxColor = isDark ? Colors.deepOrange[800]! : Colors.orange;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Frame box
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 3,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
          ),

          // Profile Image in center
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/abdullah.png",
              fit: BoxFit.cover,
              width: widget.size - 10,
              height: widget.size - 10,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.person, size: 80, color: Colors.white),
            ),
          ),

          // Animated edge-following icons
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              List<Widget> edgeIcons = [];
              for (int i = 0; i < icons.length; i++) {
                double progress =
                    (_controller.value + i / icons.length) % 1.0; // offset start
                Offset pos = _calculateEdgePosition(progress, widget.size - 24);

                edgeIcons.add(Positioned(
                  left: pos.dx,
                  top: pos.dy,
                  child: Icon(
                    icons[i],
                    color: Colors.black,
                    size: 25,
                  ),
                ));
              }
              return Stack(children: edgeIcons);
            },
          ),
        ],
      ),
    );
  }
}
