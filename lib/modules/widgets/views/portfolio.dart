// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:portfolio/modules/widgets/views/project_section.dart';
// import 'package:portfolio/modules/widgets/views/skillsections.dart'; // Make sure to import it
// import 'package:responsive_framework/responsive_framework.dart';
//
// import 'aboutsection.dart';
// import 'contactsections.dart';
// import 'homesections.dart';
//
// class PortfolioScreen extends StatefulWidget {
//   final ValueNotifier<ThemeMode> themeModeNotifier;
//
//   const PortfolioScreen({Key? key, required this.themeModeNotifier})
//       : super(key: key);
//
//   @override
//   State<PortfolioScreen> createState() => _PortfolioScreenState();
// }
//
// class _PortfolioScreenState extends State<PortfolioScreen> {
//   final ScrollController _scrollController = ScrollController();
//   final GlobalKey _homeKey = GlobalKey();
//   final GlobalKey _aboutKey = GlobalKey();
//   final GlobalKey _skillsKey = GlobalKey();
//   final GlobalKey _projectsKey = GlobalKey();
//   final GlobalKey _contactKey = GlobalKey();
//
//   void _scrollToSection(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeInOut,
//       );
//     }
//   }
//
//   Widget _buildNavButton(String text, GlobalKey key,
//       {required Color textColor}) {
//     return TextButton(
//       onPressed: () => _scrollToSection(key),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: textColor,
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//         ),
//       ),
//       style: TextButton.styleFrom(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         overlayColor: textColor.withOpacity(0.1),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = ResponsiveBreakpoints.of(context).largerOrEqualTo(
//         DESKTOP);
//     final Brightness brightness = Theme
//         .of(context)
//         .brightness;
//     final bool isDarkMode = brightness == Brightness.dark;
//
//     final Color navButtonTextColor = isDarkMode ? Colors.white70 : Colors
//         .black87;
//     final List<Color> appBarGradientColors = isDarkMode
//         ? [Colors.black, Colors.black87]
//         : [Colors.deepPurple.shade700, Colors.blueAccent.shade700];
//
//     final Color appBarForegroundColor = Colors.white;
//
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('My Portfolio'),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           foregroundColor: appBarForegroundColor,
//           elevation: 0,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: appBarGradientColors,
//               ),
//             ),
//           ),
//           actions: [
//             if (isDesktop) ...[
//               _buildNavButton(
//                   'Home', _homeKey, textColor: appBarForegroundColor),
//               _buildNavButton(
//                   'About', _aboutKey, textColor: appBarForegroundColor),
//               _buildNavButton(
//                   'Skills', _skillsKey, textColor: appBarForegroundColor),
//               _buildNavButton(
//                   'Projects', _projectsKey, textColor: appBarForegroundColor),
//               _buildNavButton(
//                   'Contact', _contactKey, textColor: appBarForegroundColor),
//             ],
//             IconButton(
//               icon: Icon(
//                 widget.themeModeNotifier.value == ThemeMode.dark
//                     ? Icons.light_mode
//                     : Icons.dark_mode,
//                 color: appBarForegroundColor,
//               ),
//               onPressed: () {
//                 widget.themeModeNotifier.value =
//                 widget.themeModeNotifier.value == ThemeMode.dark
//                     ? ThemeMode.light
//                     : ThemeMode.dark;
//               },
//               tooltip: 'Toggle Theme',
//             ),
//           ],
//         ),
//         drawer: isDesktop
//             ? null
//             : Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Theme
//                       .of(context)
//                       .primaryColor,
//                 ),
//                 child: const Text('Navigation',
//                     style: TextStyle(color: Colors.white, fontSize: 24)),
//               ),
//               ListTile(
//                 title: Text(
//                     'Home', style: TextStyle(color: navButtonTextColor)),
//                 onTap: () {
//                   _scrollToSection(_homeKey);
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                     'About', style: TextStyle(color: navButtonTextColor)),
//                 onTap: () {
//                   _scrollToSection(_aboutKey);
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                     'Skills', style: TextStyle(color: navButtonTextColor)),
//                 onTap: () {
//                   _scrollToSection(_skillsKey);
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                     'Projects', style: TextStyle(color: navButtonTextColor)),
//                 onTap: () {
//                   _scrollToSection(_projectsKey);
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                     'Contact', style: TextStyle(color: navButtonTextColor)),
//                 onTap: () {
//                   _scrollToSection(_contactKey);
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: Text(
//                   widget.themeModeNotifier.value == ThemeMode.dark
//                       ? 'Light Mode'
//                       : 'Dark Mode',
//                   style: TextStyle(color: navButtonTextColor),
//                 ),
//                 trailing: Icon(
//                   widget.themeModeNotifier.value == ThemeMode.dark
//                       ? Icons.light_mode
//                       : Icons.dark_mode,
//                   color: navButtonTextColor,
//                 ),
//                 onTap: () {
//                   widget.themeModeNotifier.value =
//                   widget.themeModeNotifier.value == ThemeMode.dark
//                       ? ThemeMode.light
//                       : ThemeMode.dark;
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           controller: _scrollController,
//           child: Column(
//             children: [
//               HomeSection(key: _homeKey, contactKey: _contactKey),
//               AboutSection(key: _aboutKey),
//               SkillsAndExperienceSection(key: _skillsKey),
//               ProjectsSection(key: _projectsKey),
//               ContactSection(key: _contactKey),
//               // const Footer(),
//               Text(
//                 'Thank You!',
//                 style: GoogleFonts.poppins(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.redAccent,
//                 ),
//               ),
//
//             ],
//           ),
//         ));
//   }
// }