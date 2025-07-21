import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text('Technical Skills', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const SkillProgressBar(skillName: 'Flutter', progress: 0.8),
          const SkillProgressBar(skillName: 'Dart', progress: 0.9),
          const SkillProgressBar(skillName: 'Firebase', progress: 0.7),
          const SkillProgressBar(skillName: 'REST APIs', progress: 0.75),
          const SkillProgressBar(skillName: 'Git', progress: 0.85),
          const SizedBox(height: 16),
          Text('Soft Skills', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              Chip(label: Text('Communication')),
              Chip(label: Text('Teamwork')),
              Chip(label: Text('Problem-Solving')),
              Chip(label: Text('Adaptability')),
              Chip(label: Text('Time Management')),
              Chip(label: Text('Creativity')),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillProgressBar extends StatelessWidget {
  final String skillName;
  final double progress;

  const SkillProgressBar({Key? key, required this.skillName, required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(skillName, style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: LinearProgressIndicator(value: progress),
          ),
        ],
      ),
    );
  }
}