// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:portfolio/modules/widgets/views/projectcard.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:flutter_animate/flutter_animate.dart';
//
// class ProjectsSection extends StatelessWidget {
//   const ProjectsSection({Key? key, required ThemeMode themeMode}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(32),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20), // Soft rounded corners
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20), // 💎 Blur effect
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.05), // Transparent-ish glass
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.white.withOpacity(0.2)),
//             ),
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Projects title with subtle animation
//                 Text(
//                   'Projects',
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )
//                     .animate()
//                     .fadeIn(duration: 600.ms, delay: 200.ms)
//                     .slideX(begin: -0.1, end: 0, duration: 600.ms),
//                 const SizedBox(height: 16),
//                 ResponsiveGridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   padding: const EdgeInsets.all(8),
//                   gridDelegate: const ResponsiveGridDelegate(
//                     minCrossAxisExtent: 250,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                   ),
//                   itemCount: 6,
//                   itemBuilder: (context, index) {
//                     return Animate(
//                       effects: [
//                         FadeEffect(
//                           duration: 600.ms,
//                           delay: (100 * index).ms,
//                         ),
//                         SlideEffect(
//                           begin: const Offset(0, 0.2),
//                           end: Offset.zero,
//                           duration: 600.ms,
//                           delay: (100 * index).ms,
//                         ),
//                       ],
//                       child: ProjectCard(
//                         title: 'Project ${index + 1}',
//                         description:
//                         'A brief description of project ${index + 1}. This is placeholder text to demonstrate content length and card layout.',
//                         techStack: const ['Flutter', 'Dart', 'Firebase'],
//                         githubLink:
//                         'https://github.com/yourusername/project${index + 1}',
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
