// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// class AboutSection extends StatelessWidget {
//   final ThemeMode themeMode;
//
//   const AboutSection({Key? key, required this.themeMode}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final isDark = themeMode == ThemeMode.dark;
//     final bool isDesktop =
//     ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);
//     final bool isTablet =
//     ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET);
//
//     final Color textColor = isDark ? Colors.white70 : Colors.black87;
//     final Color secondaryTextColor = isDark ? Colors.white60 : Colors.black54;
//     final Color backgroundColor = isDark ? Colors.grey[900]! : Colors.grey[100]!;
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
//           // Title
//           Text(
//             "About Me",
//             style: GoogleFonts.poppins(
//               fontSize: isDesktop ? 40 : 28,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//           const SizedBox(height: 30),
//
//           // Introduction and Description
//           Text(
//             "I'm Abdullah – Flutter Developer / App Designer",
//             style: GoogleFonts.poppins(
//               fontSize: isDesktop ? 24 : 18,
//               fontWeight: FontWeight.w600,
//               color: textColor,
//             ),
//           ),
//           const SizedBox(height: 16),
//
//           Text(
//             "I am a passionate Flutter Developer from Pakistan, specializing in creating responsive mobile and web applications. "
//                 "I work with Firebase, REST APIs, real-time chat, authentication, and Bluetooth thermal printing solutions. "
//                 "My goal is to build modern and polished apps with professional user interfaces and smooth functionality.",
//             style: GoogleFonts.poppins(
//               fontSize: isTablet ? 16 : 14,
//               color: secondaryTextColor,
//               height: 1.6,
//             ),
//           ),
//           const SizedBox(height: 40),
//
//           // What I Do Section
//           Text(
//             "What I Do?",
//             style: GoogleFonts.poppins(
//               fontSize: isDesktop ? 28 : 22,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Services
//           Wrap(
//             spacing: 20,
//             runSpacing: 20,
//             children: [
//               _buildServiceCard(
//                 'Flutter Apps',
//                 'I develop modern and high-performance cross-platform apps using Flutter for Android, iOS, and Web.',
//                 Icons.phone_android,
//                 backgroundColor,
//                 textColor,
//               ),
//               _buildServiceCard(
//                 'Firebase Integration',
//                 'I integrate real-time databases, authentication, cloud storage, and notifications using Firebase.',
//                 Icons.cloud_outlined,
//                 backgroundColor,
//                 textColor,
//               ),
//               _buildServiceCard(
//                 'UI/UX Design',
//                 'I create polished and responsive app UIs with professional animations and modern layouts.',
//                 Icons.design_services,
//                 backgroundColor,
//                 textColor,
//               ),
//             ],
//           ),
//           const SizedBox(height: 40),
//
//           // Fun Facts Section
//           Text(
//             "Fun Facts",
//             style: GoogleFonts.poppins(
//               fontSize: isDesktop ? 28 : 22,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Fun Facts Items
//           Wrap(
//             spacing: 20,
//             runSpacing: 20,
//             alignment: WrapAlignment.center,
//             children: [
//               _buildFunFactCard('3+', 'Years\nExperience', Icons.history,
//                   backgroundColor, textColor),
//               _buildFunFactCard('50+', 'Projects\nCompleted', Icons.task_alt,
//                   backgroundColor, textColor),
//               _buildFunFactCard('100%', 'Client\nSatisfaction', Icons.star,
//                   backgroundColor, textColor),
//               _buildFunFactCard('10K+', 'Lines of\nFlutter Code',
//                   Icons.code_outlined, backgroundColor, textColor),
//             ],
//           ),
//
//           const SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildServiceCard(String title, String description, IconData icon,
//       Color backgroundColor, Color textColor) {
//     return Container(
//       width: 300,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: 32, color: Colors.orange[700]),
//           const SizedBox(height: 12),
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: textColor,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             description,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               color: textColor.withOpacity(0.8),
//               height: 1.4,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFunFactCard(String number, String text, IconData icon,
//       Color backgroundColor, Color textColor) {
//     return Container(
//       width: 200,
//       height: 200,
//       decoration: const BoxDecoration(
//         color: Colors.black,
//         shape: BoxShape.circle,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 40, color: Colors.white),
//           const SizedBox(height: 8),
//           Text(
//             number,
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//               fontSize: 24,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             text,
//             textAlign: TextAlign.center,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
