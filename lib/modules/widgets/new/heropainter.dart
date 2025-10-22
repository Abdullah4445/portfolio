import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroBoxWithAnimatedIcons extends StatefulWidget {
  final ThemeMode themeMode;
  final double size;

  const HeroBoxWithAnimatedIcons({
    Key? key,
    required this.themeMode,
    this.size = 240,
  }) : super(key: key);

  @override
  State<HeroBoxWithAnimatedIcons> createState() => _HeroBoxWithAnimatedIconsState();
}

class _HeroBoxWithAnimatedIconsState extends State<HeroBoxWithAnimatedIcons> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(
      begin: -10.0,
      end: 10.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.themeMode == ThemeMode.dark;

    return Container(
      width: widget.size,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Profile Image Section with Floating Animation
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                // Animated Profile Image
                AnimatedBuilder(
                  animation: _floatAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _floatAnimation.value),
                      child: Center(
                        child: Container(
                          width: widget.size - 40,
                          height: widget.size - 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 15,
                                offset: Offset(0, 5 + _floatAnimation.value.abs() * 0.5),
                              ),
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: Offset(0, 3 + _floatAnimation.value.abs() * 0.3),
                              ),
                            ],
                            gradient: RadialGradient(
                              colors: [
                                Colors.blue.withOpacity(0.1),
                                Colors.transparent,
                              ],
                              radius: 0.8,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/abdullah.png",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: Colors.grey[300],
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Floating Particles Effect
                ..._buildFloatingParticles(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFloatingParticles() {
    return [
      // Top Left Particle
      Positioned(
        top: 30,
        left: 30,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, math.sin(_controller.value * 2 * math.pi) * 8),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ),

      // Top Right Particle
      Positioned(
        top: 40,
        right: 40,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, math.sin(_controller.value * 2 * math.pi + 1) * 6),
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ),

      // Bottom Left Particle
      Positioned(
        bottom: 50,
        left: 50,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, math.sin(_controller.value * 2 * math.pi + 2) * 10),
              child: Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ),

      // Bottom Right Particle
      Positioned(
        bottom: 30,
        right: 30,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, math.sin(_controller.value * 2 * math.pi + 3) * 7),
              child: Container(
                width: 3,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}