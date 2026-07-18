import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

/// A reusable frosted "Liquid Glass" surface.
///
/// Wraps [child] in a blurred, translucent panel with a luminous border,
/// soft inner highlight and a diffuse drop shadow. Works for both rounded
/// rectangles and circles (set [circle] = true).
class LiquidGlass extends StatelessWidget {
  final Widget child;
  final bool isDark;
  final double borderRadius;
  final double blur;
  final EdgeInsetsGeometry? padding;
  final Color? tint;
  final bool circle;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final List<BoxShadow>? shadows;

  const LiquidGlass({
    Key? key,
    required this.child,
    required this.isDark,
    this.borderRadius = 20,
    this.blur = 18,
    this.padding,
    this.tint,
    this.circle = false,
    this.width,
    this.height,
    this.onTap,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color baseTint = tint ?? (isDark ? const Color(0xFF1B2436) : Colors.white);
    final BorderRadius radius = BorderRadius.circular(borderRadius);

    final BoxDecoration innerDecoration = BoxDecoration(
      shape: circle ? BoxShape.circle : BoxShape.rectangle,
      borderRadius: circle ? null : radius,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          baseTint.withOpacity(isDark ? 0.30 : 0.55),
          baseTint.withOpacity(isDark ? 0.12 : 0.25),
        ],
      ),
      border: Border.all(
        color: Colors.white.withOpacity(isDark ? 0.16 : 0.60),
        width: 1.2,
      ),
    );

    final Widget blurred = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: (width != null || height != null) && padding == null
            ? Alignment.center
            : null,
        decoration: innerDecoration,
        child: child,
      ),
    );

    final Widget glass = circle
        ? ClipOval(clipBehavior: Clip.antiAlias, child: blurred)
        : ClipRRect(
            borderRadius: radius,
            clipBehavior: Clip.antiAlias,
            child: blurred,
          );

    final Widget shell = Container(
      decoration: BoxDecoration(
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circle ? null : radius,
        boxShadow: shadows ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.45 : 0.18),
                blurRadius: 30,
                spreadRadius: -6,
                offset: const Offset(0, 16),
              ),
            ],
      ),
      child: glass,
    );

    if (onTap == null) return shell;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: onTap, child: shell),
    );
  }
}

/// An ambient, slowly drifting gradient background made of soft blurred
/// colour "blobs" — the canvas the glass panels float above.
class LiquidBackground extends StatefulWidget {
  final bool isDark;
  final Widget child;

  const LiquidBackground({
    Key? key,
    required this.isDark,
    required this.child,
  }) : super(key: key);

  @override
  State<LiquidBackground> createState() => _LiquidBackgroundState();
}

class _LiquidBackgroundState extends State<LiquidBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.isDark;
    final Color base1 = isDark ? const Color(0xFF0B1120) : const Color(0xFFF3F5FA);
    final Color base2 = isDark ? const Color(0xFF111A2E) : const Color(0xFFE8ECF6);

    return Stack(
      children: [
        // Base gradient wash.
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [base1, base2],
              ),
            ),
          ),
        ),
        // Drifting blurred blobs.
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final double t = _controller.value * 2 * math.pi;
              final Size screen = MediaQuery.of(context).size;
              return ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 90, sigmaY: 90),
                child: Stack(
                  children: [
                    _blob(
                      screen: screen,
                      dx: 0.12 + 0.06 * math.sin(t),
                      dy: 0.10 + 0.05 * math.cos(t),
                      size: 360,
                      color: Colors.orange.withOpacity(isDark ? 0.35 : 0.30),
                    ),
                    _blob(
                      screen: screen,
                      dx: 0.78 + 0.05 * math.cos(t * 0.8),
                      dy: 0.20 + 0.06 * math.sin(t * 1.1),
                      size: 420,
                      color: (isDark ? Colors.indigoAccent : Colors.blueAccent)
                          .withOpacity(isDark ? 0.35 : 0.22),
                    ),
                    _blob(
                      screen: screen,
                      dx: 0.55 + 0.07 * math.sin(t * 1.3),
                      dy: 0.82 + 0.05 * math.cos(t),
                      size: 460,
                      color: (isDark ? Colors.tealAccent : Colors.purpleAccent)
                          .withOpacity(isDark ? 0.22 : 0.20),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        widget.child,
      ],
    );
  }

  Widget _blob({
    required Size screen,
    required double dx,
    required double dy,
    required double size,
    required Color color,
  }) {
    return Positioned(
      left: screen.width * dx - size / 2,
      top: screen.height * dy - size / 2,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
