// import 'package:flutter/material.dart';
// import 'dart:math'
// as math; // For mathematical operations like sin/cos for circular progress
//
// // This is the main skills and experience section widget for your portfolio.
// class SkillsAndExperienceSection extends StatelessWidget {
//   // Removed the optional 'key' parameter from the constructor to prevent GlobalKey conflicts
//   const SkillsAndExperienceSection({super.key, required ThemeMode themeMode});
//
//   @override
//   Widget build(BuildContext context) {
//     // Determine current theme brightness
//     final Brightness brightness = Theme.of(context).brightness;
//     final bool isDarkMode = brightness == Brightness.dark;
//
//     // Define colors based on theme brightness
//     final Color backgroundColor = isDarkMode ? Colors.grey[900]! : Colors.white;
//     final Color textColor = isDarkMode ? Colors.white : Colors.black87;
//     final Color secondaryTextColor = isDarkMode
//         ? Colors.grey[300]!
//         : Colors.grey[700]!;
//     final Color tertiaryTextColor = isDarkMode
//         ? Colors.grey[400]!
//         : Colors.grey[600]!;
//     final Color shadowColor = isDarkMode
//         ? Colors.black.withOpacity(0.3)
//         : Colors.grey.withOpacity(0.1);
//     final Color progressBackgroundColor = isDarkMode
//         ? Colors.grey[700]!
//         : Colors.grey[200]!;
//
//     return Container(
//       padding: const EdgeInsets.all(32), // Overall padding for the section
//       decoration: BoxDecoration(
//         color: backgroundColor, // Background color based on theme
//         borderRadius: BorderRadius.circular(16), // Rounded corners
//         boxShadow: [
//           BoxShadow(
//             color: shadowColor, // Shadow color based on theme
//             spreadRadius: 2,
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Section Title
//           Text(
//             'Combination of Skill & Experience', // Main title
//             style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//               color: textColor, // Text color based on theme
//             ),
//           ),
//           const SizedBox(height: 40), // Spacing below the title
//           // Use LayoutBuilder for responsiveness
//           LayoutBuilder(
//             builder: (context, constraints) {
//               if (constraints.maxWidth < 700) {
//                 // For smaller screens, display as a single column
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Left Column: Education/Experience
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Education Sub-section Header
//                         _SectionHeader(
//                           icon: Icons.school,
//                           title: 'Education',
//                           color: Colors.deepOrange,
//                           // Orange color for icon and title
//                           textColor: textColor, // Pass text color
//                         ),
//                         const SizedBox(height: 20),
//
//                         // Education Entries
//                         _EducationEntry(
//                           degree: 'Currently in 12th Class',
//                           university: 'Graduate College Degree  (Ongoing)',
//                           years: 'Present',
//                           description:
//                           'Focusing on core subjects and building foundational knowledge. Actively exploring career paths in technology.',
//                           textColor: textColor,
//                           // Pass text color
//                           secondaryTextColor: secondaryTextColor,
//                           // Pass secondary text color
//                           tertiaryTextColor:
//                           tertiaryTextColor, // Pass tertiary text color
//                         ),
//                         const SizedBox(height: 24),
//                         _EducationEntry(
//                           degree: 'Flutter Learning Journey',
//                           university: 'AiLab Solutions',
//                           // Updated to AiLab Solutions
//                           years: 'Late 2023 - Present',
//                           description:
//                           'Began learning Flutter in late 2023 at AiLab Solutions. Gained proficiency in Dart, UI/UX design, and building cross-platform mobile applications.',
//                           textColor: textColor,
//                           // Pass text color
//                           secondaryTextColor: secondaryTextColor,
//                           // Pass secondary text color
//                           tertiaryTextColor:
//                           tertiaryTextColor, // Pass tertiary text color
//                         ),
//                         const SizedBox(height: 24),
//                         _EducationEntry(
//                           degree: 'Advanced Flutter Concepts',
//                           university: 'Continuous Learning',
//                           years: 'Ongoing',
//                           description:
//                           'Continuously learning advanced Flutter topics including state management, animations, and performance optimization.',
//                           textColor: textColor,
//                           // Pass text color
//                           secondaryTextColor: secondaryTextColor,
//                           // Pass secondary text color
//                           tertiaryTextColor:
//                           tertiaryTextColor, // Pass tertiary text color
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 40),
//                     // Spacing between sections in column layout
//
//                     // Right Column: Personal and Software Skills
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Personal Skills Sub-section Header
//                         _SectionHeader(
//                           icon: Icons.person,
//                           title: 'Personal Skills',
//                           color: Colors.blueAccent,
//                           // Blue color for icon and title
//                           textColor: textColor, // Pass text color
//                         ),
//                         const SizedBox(height: 20),
//
//                         // Personal Skills Progress Bars
//                         _PersonalSkillBar(
//                           skillName: 'Time Management',
//                           progress: 0.9,
//                           textColor: textColor, // Pass text color
//                           progressBackgroundColor:
//                           progressBackgroundColor, // Pass background color
//                         ),
//                         _PersonalSkillBar(
//                           skillName: 'Adaptability',
//                           progress: 0.85,
//                           textColor: textColor, // Pass text color
//                           progressBackgroundColor:
//                           progressBackgroundColor, // Pass background color
//                         ),
//                         _PersonalSkillBar(
//                           skillName: 'Teamwork',
//                           progress: 0.95,
//                           textColor: textColor, // Pass text color
//                           progressBackgroundColor:
//                           progressBackgroundColor, // Pass background color
//                         ),
//                         _PersonalSkillBar(
//                           skillName: 'Communication',
//                           progress: 0.88,
//                           textColor: textColor, // Pass text color
//                           progressBackgroundColor:
//                           progressBackgroundColor, // Pass background color
//                         ),
//                         const SizedBox(height: 40),
//
//                         // Software Skills Sub-section Header
//                         _SectionHeader(
//                           icon: Icons.code,
//                           title: 'Software Skills',
//                           color: Colors.green, // Green color for icon and title
//                           textColor: textColor, // Pass text color
//                         ),
//                         const SizedBox(height: 20),
//
//                         // Software Skills Circular Indicators
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             _CircularSkillIndicator(
//                               skillName: 'Flutter',
//                               percentage: 85,
//                               colors: const [
//                                 Colors.blue,
//                                 Colors.lightBlueAccent,
//                                 Colors.cyan,
//                               ],
//                               textColor: textColor,
//                               // Pass text color
//                               progressBackgroundColor:
//                               progressBackgroundColor, // Pass background color
//                             ),
//                             _CircularSkillIndicator(
//                               skillName: 'Dart',
//                               percentage: 90,
//                               colors: const [
//                                 Colors.teal,
//                                 Colors.greenAccent,
//                                 Colors.lightGreen,
//                               ],
//                               textColor: textColor,
//                               // Pass text color
//                               progressBackgroundColor:
//                               progressBackgroundColor, // Pass background color
//                             ),
//                             _CircularSkillIndicator(
//                               skillName: 'Firebase',
//                               percentage: 75,
//                               colors: const [
//                                 Colors.orange,
//                                 Colors.deepOrangeAccent,
//                                 Colors.redAccent,
//                               ],
//                               textColor: textColor,
//                               // Pass text color
//                               progressBackgroundColor:
//                               progressBackgroundColor, // Pass background color
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             _CircularSkillIndicator(
//                               skillName: 'REST APIs',
//                               percentage: 80,
//                               colors: const [
//                                 Colors.purple,
//                                 Colors.deepPurpleAccent,
//                                 Colors.pink,
//                               ],
//                               textColor: textColor,
//                               // Pass text color
//                               progressBackgroundColor:
//                               progressBackgroundColor, // Pass background color
//                             ),
//                             _CircularSkillIndicator(
//                               skillName: 'Git',
//                               percentage: 88,
//                               colors: const [
//                                 Colors.grey,
//                                 Colors.blueGrey,
//                                 Colors.black54,
//                               ],
//                               textColor: textColor,
//                               // Pass text color
//                               progressBackgroundColor:
//                               progressBackgroundColor, // Pass background color
//                             ),
//                             _CircularSkillIndicator(
//                               skillName: 'UI/UX Design',
//                               percentage: 70,
//                               colors: const [
//                                 Colors.amber,
//                                 Colors.yellowAccent,
//                                 Colors.lime,
//                               ],
//                               textColor: textColor,
//                               // Pass text color
//                               progressBackgroundColor:
//                               progressBackgroundColor, // Pass background color
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               } else {
//                 // For larger screens, display as two columns
//                 return Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Left Column: Education/Experience
//                     Expanded(
//                       flex: 3, // Give more space to the left column
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Education Sub-section Header
//                           _SectionHeader(
//                             icon: Icons.school,
//                             title: 'Education',
//                             color: Colors.deepOrange,
//                             // Orange color for icon and title
//                             textColor: textColor, // Pass text color
//                           ),
//                           const SizedBox(height: 20),
//
//                           // Education Entries
//                           _EducationEntry(
//                             degree: 'Currently in 12th Class',
//                             university: 'Graduate College Degree (Ongoing)',
//                             years: 'Present',
//                             description:
//                             'Focusing on core subjects and building foundational knowledge. Actively exploring career paths in technology.',
//                             textColor: textColor,
//                             // Pass text color
//                             secondaryTextColor: secondaryTextColor,
//                             // Pass secondary text color
//                             tertiaryTextColor:
//                             tertiaryTextColor, // Pass tertiary text color
//                           ),
//                           const SizedBox(height: 24),
//                           _EducationEntry(
//                             degree: 'Flutter Learning Journey',
//                             university: 'AiLab Solutions',
//                             // Updated to AiLab Solutions
//                             years: 'Late 2023 - Present',
//                             description:
//                             'Began learning Flutter in late 2023 at AiLab Solutions. Gained proficiency in Dart, UI/UX design, and building cross-platform mobile applications.',
//                             textColor: textColor,
//                             // Pass text color
//                             secondaryTextColor: secondaryTextColor,
//                             // Pass secondary text color
//                             tertiaryTextColor:
//                             tertiaryTextColor, // Pass tertiary text color
//                           ),
//                           const SizedBox(height: 24),
//                           _EducationEntry(
//                             degree: 'Advanced Flutter Concepts',
//                             university: 'Continuous Learning',
//                             years: 'Ongoing',
//                             description:
//                             'Continuously learning advanced Flutter topics including state management, animations, and performance optimization.',
//                             textColor: textColor,
//                             // Pass text color
//                             secondaryTextColor: secondaryTextColor,
//                             // Pass secondary text color
//                             tertiaryTextColor:
//                             tertiaryTextColor, // Pass tertiary text color
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 40), // Spacing between columns
//                     // Right Column: Personal and Software Skills
//                     Expanded(
//                       flex: 2, // Give less space to the right column
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Personal Skills Sub-section Header
//                           _SectionHeader(
//                             icon: Icons.person,
//                             title: 'Personal Skills',
//                             color: Colors.blueAccent,
//                             // Blue color for icon and title
//                             textColor: textColor, // Pass text color
//                           ),
//                           const SizedBox(height: 20),
//
//                           // Personal Skills Progress Bars
//                           _PersonalSkillBar(
//                             skillName: 'Time Management',
//                             progress: 0.9,
//                             textColor: textColor, // Pass text color
//                             progressBackgroundColor:
//                             progressBackgroundColor, // Pass background color
//                           ),
//                           _PersonalSkillBar(
//                             skillName: 'Adaptability',
//                             progress: 0.85,
//                             textColor: textColor, // Pass text color
//                             progressBackgroundColor:
//                             progressBackgroundColor, // Pass background color
//                           ),
//                           _PersonalSkillBar(
//                             skillName: 'Teamwork',
//                             progress: 0.95,
//                             textColor: textColor, // Pass text color
//                             progressBackgroundColor:
//                             progressBackgroundColor, // Pass background color
//                           ),
//                           _PersonalSkillBar(
//                             skillName: 'Communication',
//                             progress: 0.88,
//                             textColor: textColor, // Pass text color
//                             progressBackgroundColor:
//                             progressBackgroundColor, // Pass background color
//                           ),
//                           const SizedBox(height: 40),
//
//                           // Software Skills Sub-section Header
//                           _SectionHeader(
//                             icon: Icons.code,
//                             title: 'Software Skills',
//                             color: Colors.green,
//                             // Green color for icon and title
//                             textColor: textColor, // Pass text color
//                           ),
//                           const SizedBox(height: 20),
//
//                           // Software Skills Circular Indicators
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               _CircularSkillIndicator(
//                                 skillName: 'Flutter',
//                                 percentage: 85,
//                                 colors: const [
//                                   Colors.blue,
//                                   Colors.lightBlueAccent,
//                                   Colors.cyan,
//                                 ],
//                                 textColor: textColor,
//                                 // Pass text color
//                                 progressBackgroundColor:
//                                 progressBackgroundColor, // Pass background color
//                               ),
//                               _CircularSkillIndicator(
//                                 skillName: 'Dart',
//                                 percentage: 90,
//                                 colors: const [
//                                   Colors.teal,
//                                   Colors.greenAccent,
//                                   Colors.lightGreen,
//                                 ],
//                                 textColor: textColor,
//                                 // Pass text color
//                                 progressBackgroundColor:
//                                 progressBackgroundColor, // Pass background color
//                               ),
//                               _CircularSkillIndicator(
//                                 skillName: 'Firebase',
//                                 percentage: 75,
//                                 colors: const [
//                                   Colors.orange,
//                                   Colors.deepOrangeAccent,
//                                   Colors.redAccent,
//                                 ],
//                                 textColor: textColor,
//                                 // Pass text color
//                                 progressBackgroundColor:
//                                 progressBackgroundColor, // Pass background color
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               _CircularSkillIndicator(
//                                 skillName: 'REST APIs',
//                                 percentage: 80,
//                                 colors: const [
//                                   Colors.purple,
//                                   Colors.deepPurpleAccent,
//                                   Colors.pink,
//                                 ],
//                                 textColor: textColor,
//                                 // Pass text color
//                                 progressBackgroundColor:
//                                 progressBackgroundColor, // Pass background color
//                               ),
//                               _CircularSkillIndicator(
//                                 skillName: 'Git',
//                                 percentage: 88,
//                                 colors: const [
//                                   Colors.grey,
//                                   Colors.blueGrey,
//                                   Colors.black54,
//                                 ],
//                                 textColor: textColor,
//                                 // Pass text color
//                                 progressBackgroundColor:
//                                 progressBackgroundColor, // Pass background color
//                               ),
//                               _CircularSkillIndicator(
//                                 skillName: 'UI/UX Design',
//                                 percentage: 70,
//                                 colors: const [
//                                   Colors.amber,
//                                   Colors.yellowAccent,
//                                   Colors.lime,
//                                 ],
//                                 textColor: textColor,
//                                 // Pass text color
//                                 progressBackgroundColor:
//                                 progressBackgroundColor, // Pass background color
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // A helper widget for section headers (with icon and text)
// class _SectionHeader extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final Color color;
//   final Color textColor; // Added textColor parameter
//
//   const _SectionHeader({
//     super.key, // Use super.key for StatelessWidgets
//     required this.icon,
//     required this.title,
//     required this.color,
//     required this.textColor, // Required textColor
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(icon, color: color, size: 28), // Icon
//         const SizedBox(width: 10),
//         Text(
//           title,
//           style: Theme.of(context).textTheme.titleLarge?.copyWith(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: textColor, // Use passed textColor
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // Widget for an education/experience entry
// class _EducationEntry extends StatelessWidget {
//   final String degree;
//   final String university;
//   final String years;
//   final String description;
//   final Color textColor; // Added textColor parameter
//   final Color secondaryTextColor; // Added secondaryTextColor parameter
//   final Color tertiaryTextColor; // Added tertiaryTextColor parameter
//
//   const _EducationEntry({
//     super.key, // Use super.key for StatelessWidgets
//     required this.degree,
//     required this.university,
//     required this.years,
//     required this.description,
//     required this.textColor, // Required textColor
//     required this.secondaryTextColor, // Required secondaryTextColor
//     required this.tertiaryTextColor, // Required tertiaryTextColor
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Timeline dot and line
//         Column(
//           children: [
//             Container(
//               width: 12,
//               height: 12,
//               decoration: BoxDecoration(
//                 color: Colors.deepOrange, // Orange dot
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.deepOrange.shade100, width: 2),
//               ),
//             ),
//             Container(
//               width: 2,
//               height: 80, // Height of the line
//               color: Colors
//                   .grey[300], // Grey line (can be adjusted for dark mode if needed)
//             ),
//           ],
//         ),
//         const SizedBox(width: 20), // Spacing between dot/line and text
//         // Text content
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 degree,
//                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                   color: textColor, // Use passed textColor
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     university,
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                       color:
//                       secondaryTextColor, // Use passed secondaryTextColor
//                     ),
//                   ),
//                   Text(
//                     years,
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Colors.deepOrange, // Orange years
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   color: tertiaryTextColor, // Use passed tertiaryTextColor
//                 ),
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // Widget for a personal skill progress bar with animated color
// class _PersonalSkillBar extends StatefulWidget {
//   final String skillName;
//   final double progress; // Progress from 0.0 to 1.0
//   final Color textColor; // Added textColor parameter
//   final Color
//   progressBackgroundColor; // Added progressBackgroundColor parameter
//
//   const _PersonalSkillBar({
//     super.key, // Use super.key for StatefulWidgets
//     required this.skillName,
//     required this.progress,
//     required this.textColor, // Required textColor
//     required this.progressBackgroundColor, // Required progressBackgroundColor
//   });
//
//   @override
//   State<_PersonalSkillBar> createState() => _PersonalSkillBarState();
// }
//
// class _PersonalSkillBarState extends State<_PersonalSkillBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _progressController;
//   late Animation<double> _progressAnimation;
//   late Animation<Color?> _colorAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _progressController = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         milliseconds: 1500,
//       ), // Longer duration for smoother effect
//     );
//
//     _progressAnimation = Tween<double>(begin: 0.0, end: widget.progress)
//         .animate(
//       CurvedAnimation(
//         parent: _progressController,
//         curve: Curves.easeOutCubic,
//       ),
//     );
//
//     // Define a sequence of colors for the animation
//     _colorAnimation =
//         ColorTween(
//           begin: Colors.blueAccent.shade100,
//           end: Colors.blueAccent,
//         ).animate(
//           CurvedAnimation(
//             parent: _progressController,
//             curve: const Interval(
//               0.0,
//               1.0,
//               curve: Curves.easeInOut,
//             ), // Animate color over the full progress duration
//           ),
//         );
//
//     _progressController.forward(); // Start the animation
//   }
//
//   @override
//   void dispose() {
//     _progressController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.skillName,
//             style: Theme.of(context).textTheme.titleMedium?.copyWith(
//               fontWeight: FontWeight.w500,
//               color: widget.textColor, // Use passed textColor
//             ),
//           ),
//           const SizedBox(height: 8),
//           // Animated Linear Progress Indicator
//           AnimatedBuilder(
//             animation: _progressController,
//             builder: (context, child) {
//               return LinearProgressIndicator(
//                 value: _progressAnimation.value,
//                 minHeight: 8,
//                 // Thinner bar
//                 backgroundColor: widget.progressBackgroundColor,
//                 // Use passed background color
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   _colorAnimation.value!,
//                 ),
//                 // Animated color
//                 borderRadius: BorderRadius.circular(4), // Rounded corners
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Widget for a circular skill indicator (for software skills) with animated color and tap effect
// class _CircularSkillIndicator extends StatefulWidget {
//   final String skillName;
//   final int percentage;
//   final List<Color> colors; // List of colors for the gradient
//   final Color textColor; // Added textColor parameter
//   final Color
//   progressBackgroundColor; // Added progressBackgroundColor parameter
//
//   const _CircularSkillIndicator({
//     super.key, // Use super.key for StatefulWidgets
//     required this.skillName,
//     required this.percentage,
//     this.colors = const [Colors.green, Colors.lightGreen], // Default gradient
//     required this.textColor, // Required textColor
//     required this.progressBackgroundColor, // Required progressBackgroundColor
//   });
//
//   @override
//   State<_CircularSkillIndicator> createState() =>
//       _CircularSkillIndicatorState();
// }
//
// class _CircularSkillIndicatorState extends State<_CircularSkillIndicator>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _progressAnimation;
//   late Animation<double> _scaleAnimation; // For tap effect
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         milliseconds: 1500,
//       ), // Animation duration for progress
//     );
//
//     _progressAnimation =
//         Tween<double>(begin: 0.0, end: widget.percentage / 100.0).animate(
//           CurvedAnimation(
//             parent: _animationController,
//             curve: Curves.easeOutCubic,
//           ),
//         );
//
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.elasticOut, // Bouncy effect
//       ),
//     );
//
//     _animationController.forward(); // Start the progress animation
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _handleTap() {
//     // Trigger a quick scale animation on tap
//     _animationController.reset();
//     _animationController.forward().then((_) {
//       // After forward, reverse it quickly to return to original size
//       _animationController.reverse(from: _animationController.value);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap, // Handle tap gesture
//       child: AnimatedBuilder(
//         animation: _animationController,
//         builder: (context, child) {
//           return Column(
//             // Added Column to arrange circle and text vertically
//             children: [
//               Transform.scale(
//                 scale: _scaleAnimation.value, // Apply scale animation on tap
//                 child: SizedBox(
//                   width: 80, // Size of the circle
//                   height: 80,
//                   child: CustomPaint(
//                     painter: _CircularProgressPainter(
//                       _progressAnimation.value,
//                       widget.colors, // Pass colors to the painter
//                       widget
//                           .progressBackgroundColor, // Pass background color to painter
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${widget.percentage}%',
//                         style: Theme.of(context).textTheme.titleMedium
//                             ?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Colors
//                               .green
//                               .shade700, // Darker green for contrast
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8), // Spacing between circle and text
//               Text(
//                 // This Text widget displays the skill name
//                 widget.skillName,
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   color: widget.textColor, // Use passed textColor
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// // Custom painter to draw the circular progress indicator with a gradient
// class _CircularProgressPainter extends CustomPainter {
//   final double progress;
//   final List<Color> colors; // Colors for the gradient
//   final Color backgroundColor; // Added background color for the circle
//
//   _CircularProgressPainter(this.progress, this.colors, this.backgroundColor);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final strokeWidth = 8.0; // Thickness of the line
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = math.min(size.width / 2, size.height / 2) - strokeWidth / 2;
//
//     // Background circle (grey or adjusted for dark mode)
//     final backgroundPaint = Paint()
//       ..color =
//           backgroundColor // Use passed background color
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth;
//     canvas.drawCircle(center, radius, backgroundPaint);
//
//     // Progress arc with gradient
//     final Rect arcRect = Rect.fromCircle(center: center, radius: radius);
//     final Gradient gradient = LinearGradient(
//       colors: colors, // Use provided colors for gradient
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//     );
//
//     final progressPaint = Paint()
//       ..shader = gradient
//           .createShader(arcRect) // Apply gradient to the arc
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap
//           .round // Round cap
//       ..strokeWidth = strokeWidth;
//
//     final arcAngle =
//         2 * math.pi * progress; // Angle of the arc based on progress
//     canvas.drawArc(
//       arcRect,
//       -math.pi / 2, // Start from the top
//       arcAngle,
//       false,
//       progressPaint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
//     return oldDelegate.progress != progress ||
//         oldDelegate.colors != colors ||
//         oldDelegate.backgroundColor != backgroundColor;
//   }
// }
//
