import 'package:flutter/material.dart';

class PersonalSkillBar extends StatefulWidget {
  final String skillName;
  final double progress;
  final Color textColor;
  final Color progressBackgroundColor;

  const PersonalSkillBar({
    Key? key,
    required this.skillName,
    required this.progress,
    required this.textColor,
    required this.progressBackgroundColor,
  }) : super(key: key);

  @override
  State<PersonalSkillBar> createState() => _PersonalSkillBarState();
}

class _PersonalSkillBarState extends State<PersonalSkillBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: widget.progress)
        .animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeOutCubic,
    ));

    _colorAnimation = ColorTween(
      begin: Colors.blueAccent.shade100,
      end: Colors.blueAccent,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
    ));

    _progressController.forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.skillName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: widget.textColor,
            ),
          ),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _progressController,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _progressAnimation.value,
                minHeight: 8,
                backgroundColor: widget.progressBackgroundColor,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _colorAnimation.value!,
                ),
                borderRadius: BorderRadius.circular(4),
              );
            },
          ),
        ],
      ),
    );
  }
}