import 'package:flutter/material.dart';

import '../../../main.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final String githubLink;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.techStack,
    required this.githubLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: techStack.map((tech) => Chip(label: Text(tech))).toList(),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.open_in_new),
                tooltip: 'View on GitHub',
                onPressed: () {
                  launchURL(context, githubLink);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
