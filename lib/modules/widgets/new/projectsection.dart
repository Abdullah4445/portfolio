// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class ProjectSection extends StatelessWidget {
//   final ThemeMode themeMode;
//
//   const ProjectSection({Key? key, required this.themeMode}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final isDark = themeMode == ThemeMode.dark;
//     final bool isDesktop =
//     ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);
//
//     final Color textColor = isDark ? Colors.white70 : Colors.black87;
//     final Color backgroundColor =
//     isDark ? Colors.grey[900]! : Colors.grey[100]!;
//
//     final List<Project> projects = [
//       Project(
//           title: "E-commerce App",
//           description:
//           "Flutter e-commerce app with login, product listings, cart & payment integration.",
//           imageUrl:
//           "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=60",
//           projectUrl: "https://github.com/example/ecommerce-app"),
//       Project(
//           title: "Portfolio Website",
//           description:
//           "Responsive React-based portfolio website showcasing skills & projects.",
//           imageUrl:
//           "https://images.unsplash.com/photo-1611162617474-5b21e879e113?auto=format&fit=crop&w=800&q=60",
//           projectUrl: "https://github.com/example/portfolio-website"),
//       Project(
//           title: "Mobile Game",
//           description:
//           "Casual Unity mobile game with addictive gameplay & smooth performance.",
//           imageUrl:
//           "https://images.unsplash.com/photo-1541963463532-d68292c34e14?auto=format&fit=crop&w=800&q=60",
//           projectUrl: "https://github.com/example/mobile-game"),
//       Project(
//           title: "Data Dashboard",
//           description:
//           "Web dashboard built with Python & Chart.js for data visualization.",
//           imageUrl:
//           "https://images.unsplash.com/photo-1587620962725-ead37c8b51e1?auto=format&fit=crop&w=800&q=60",
//           projectUrl: "https://github.com/example/data-dashboard"),
//     ];
//
//     return Container(
//       color: backgroundColor,
//       padding: EdgeInsets.symmetric(
//         horizontal: isDesktop ? 100 : 24,
//         vertical: isDesktop ? 80 : 50,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Projects",
//             style: GoogleFonts.poppins(
//               fontSize: isDesktop ? 40 : 28,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//           const SizedBox(height: 40),
//
//           // ✅ Responsive Grid Without Overflow
//           LayoutBuilder(
//             builder: (context, constraints) {
//               int crossAxisCount = 1;
//               if (constraints.maxWidth > 1200) {
//                 crossAxisCount = 3;
//               } else if (constraints.maxWidth > 800) {
//                 crossAxisCount = 2;
//               }
//
//               return GridView.count(
//                 crossAxisCount: crossAxisCount,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20,
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero, // remove default padding
//                 physics: const NeverScrollableScrollPhysics(),
//                 childAspectRatio: 0.78,
//                 children: projects
//                     .map((project) => Align(
//                   alignment: Alignment.center,
//                   child: _buildProjectCard(project, textColor),
//                 ))
//                     .toList(),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProjectCard(Project project, Color textColor) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.15),
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             )
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Stack(
//             children: [
//               // Project Image
//               Positioned.fill(
//                 child: Image.network(
//                   project.imageUrl,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//
//               // Dark Gradient Overlay
//               Positioned.fill(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.black.withOpacity(0.6),
//                         Colors.transparent
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                 ),
//               ),
//
//               // Project Info
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.black54, Colors.transparent],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         project.title,
//                         style: GoogleFonts.poppins(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Text(
//                         project.description,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: GoogleFonts.poppins(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const FaIcon(FontAwesomeIcons.github,
//                                 color: Colors.white),
//                             onPressed: () {
//                               print("Open GitHub: ${project.projectUrl}");
//                             },
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.open_in_new,
//                                 color: Colors.white),
//                             onPressed: () {
//                               print(
//                                   "Open Live Project: ${project.projectUrl}");
//                             },
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Project {
//   final String title;
//   final String description;
//   final String imageUrl;
//   final String projectUrl;
//
//   Project({
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     required this.projectUrl,
//   });
// }
