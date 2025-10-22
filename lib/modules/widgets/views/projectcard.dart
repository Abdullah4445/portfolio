// import 'dart:ui'; // For BackdropFilter
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
//
// import '../../../main.dart';
//
// class ProjectCard extends StatefulWidget {
//   final String title;
//   final String description;
//   final List<String> techStack;
//   final String githubLink;
//
//   const ProjectCard({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.techStack,
//     required this.githubLink,
//   }) : super(key: key);
//
//   @override
//   State<ProjectCard> createState() => _ProjectCardState();
// }
//
// class _ProjectCardState extends State<ProjectCard> {
//   bool _isHovering = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovering = true),
//       onExit: (_) => setState(() => _isHovering = false),
//       child: AnimatedScale(
//         scale: _isHovering ? 1.03 : 1.0,
//         duration: 200.ms,
//         curve: Curves.easeOut,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.1), // semi-transparent blur
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.white.withOpacity(0.2)),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.title,
//                     style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Expanded(
//                     child: Text(
//                       widget.description,
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 4,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Wrap(
//                     spacing: 4,
//                     runSpacing: 4,
//                     children: widget.techStack.map((tech) {
//                       return Chip(
//                         label: Text(tech),
//                       );
//                     }).toList(),
//                   ),
//                   const SizedBox(height: 8),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: IconButton(
//                       icon: const Icon(Icons.open_in_new, color: Colors.white),
//                       tooltip: 'View on GitHub',
//                       onPressed: () => launchURL(context, widget.githubLink),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
