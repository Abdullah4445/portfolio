import 'package:flutter/material.dart';
import 'package:portfolio/modules/widgets/views/projectcard.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Projects', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ResponsiveGridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            gridDelegate: const ResponsiveGridDelegate(
              // mainAxisExtent: 300,
              // maxColumnsPerRow: 3,
              minCrossAxisExtent: 250,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return ProjectCard(
                title: 'Project ${index + 1}',
                description: 'A brief description of project ${index + 1}. This is placeholder text to demonstrate content length and card layout. You can expand on this for each project.',
                techStack: const ['Flutter', 'Dart', 'Firebase'],
                githubLink: 'https://github.com/yourusername/project${index + 1}',
              );
            },
          ),
        ],
      ),
    );
  }
}