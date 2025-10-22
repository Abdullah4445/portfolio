import 'package:flutter/material.dart';

import 'circular_progress_paiter.dart';

class CircularSkillIndicator extends StatefulWidget {
  final String skillName;
  final int percentage;
  final List<Color> colors;
  final Color textColor;
  final Color progressBackgroundColor;

  const CircularSkillIndicator({
    Key? key,
    required this.skillName,
    required this.percentage,
    this.colors = const [Colors.green, Colors.lightGreen],
    required this.textColor,
    required this.progressBackgroundColor,
  }) : super(key: key);

  @override
  State<CircularSkillIndicator> createState() => _CircularSkillIndicatorState();
}

class _CircularSkillIndicatorState extends State<CircularSkillIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _progressAnimation =
        Tween<double>(begin: 0.0, end: widget.percentage / 100.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    _animationController.reset();
    _animationController.forward().then((_) {
      _animationController.reverse(from: _animationController.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Column(
            children: [
              Transform.scale(
                scale: _scaleAnimation.value,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CustomPaint(
                    painter: CircularProgressPainter(
                      _progressAnimation.value,
                      widget.colors,
                      widget.progressBackgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        '${widget.percentage}%',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.skillName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: widget.textColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}