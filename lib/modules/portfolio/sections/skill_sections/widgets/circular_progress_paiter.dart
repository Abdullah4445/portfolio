import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final List<Color> colors;
  final Color backgroundColor;

  CircularProgressPainter(this.progress, this.colors, this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 8.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    final Rect arcRect = Rect.fromCircle(center: center, radius: radius);
    final Gradient gradient = LinearGradient(
      colors: colors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(arcRect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final arcAngle = 2 * math.pi * progress;
    canvas.drawArc(
      arcRect,
      -math.pi / 2,
      arcAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.colors != colors ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}