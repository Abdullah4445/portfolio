// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:portfolio/modules/widgets/new/projectsection.dart';
// import 'package:portfolio/modules/widgets/new/skill.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// // Import your custom sections
// import '../views/aboutsection.dart';
// import '../views/contactsections.dart';
// import '../views/homesections.dart';
// import '../views/project_section.dart';
// import '../views/skillsections.dart';
// import 'about.dart';
// import 'contact.dart';
// import 'fixedrightcircularmenu.dart';
// import 'footer.dart';
// import 'home.dart';
// import 'lifesidebarmenu.dart';
//
//
// class PortfolioScreen extends StatefulWidget {
//   final ValueNotifier<ThemeMode> themeModeNotifier;
//
//   const PortfolioScreen({
//     Key? key,
//     required this.themeModeNotifier,
//   }) : super(key: key);
//
//   @override
//   State<PortfolioScreen> createState() => _PortfolioScreenState();
// }
//
// class _PortfolioScreenState extends State<PortfolioScreen> {
//   final AutoScrollController _scrollController = AutoScrollController();
//   int _currentSectionIndex = 0; // 0: Home, 1: About, 2: Skills, 3: Projects, 4: Contact
//
//   final GlobalKey _homeKey = GlobalKey();
//   final GlobalKey _aboutKey = GlobalKey();
//   final GlobalKey _skillsKey = GlobalKey();
//   final GlobalKey _projectsKey = GlobalKey();
//   final GlobalKey _contactKey = GlobalKey();
//
//   late List<GlobalKey> _sectionKeys;
//   late List<String> _sectionTitles;
//
//   // Track if we've scrolled past the hero section to show the left sidebar
//   bool _showLeftSidebar = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _sectionKeys = [
//       _homeKey,
//       _aboutKey,
//       _skillsKey,
//       _projectsKey,
//       _contactKey
//     ];
//     _sectionTitles = [
//       'Home',
//       'About Me',
//       'Skills & Experience',
//       'Projects',
//       'Contact'
//     ];
//
//     _scrollController.addListener(_updateCurrentSectionAndSidebarVisibility);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(_updateCurrentSectionAndSidebarVisibility);
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void _updateCurrentSectionAndSidebarVisibility() {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final double homeSectionHeight = _homeKey.currentContext?.size?.height ?? screenHeight;
//
//     // Determine if left sidebar should be shown
//     if (_scrollController.offset > homeSectionHeight - 100 && !_showLeftSidebar) {
//       setState(() {
//         _showLeftSidebar = true;
//       });
//     } else if (_scrollController.offset <= homeSectionHeight - 100 && _showLeftSidebar) {
//       setState(() {
//         _showLeftSidebar = false;
//       });
//     }
//
//     // Update current section index
//     for (int i = 0; i < _sectionKeys.length; i++) {
//       final keyContext = _sectionKeys[i].currentContext;
//       if (keyContext != null) {
//         final renderBox = keyContext.findRenderObject() as RenderBox;
//         final position = renderBox.localToGlobal(Offset.zero);
//
//         if (position.dy < screenHeight * 0.5 &&
//             position.dy + renderBox.size.height > screenHeight * 0.5) {
//           if (_currentSectionIndex != i) {
//             setState(() {
//               _currentSectionIndex = i;
//             });
//           }
//           break;
//         }
//       }
//     }
//   }
//
//   Future<void> _scrollToSection(int index) async {
//     if (index == 0 && _showLeftSidebar) {
//       setState(() { _showLeftSidebar = false; });
//     } else if (index != 0 && !_showLeftSidebar) {
//       setState(() { _showLeftSidebar = true; });
//     }
//
//     await _scrollController.scrollToIndex(
//       index,
//       duration: const Duration(milliseconds: 700),
//       preferPosition: AutoScrollPosition.begin,
//     );
//     setState(() {
//       _currentSectionIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final currentTheme = Theme.of(context);
//     final isDarkTheme = currentTheme.brightness == Brightness.dark;
//
//     final bool isDesktop =
//     ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Main Scrollable Content Area
//           Positioned.fill(
//             left: _showLeftSidebar && isDesktop ? 200 : 0,
//             child: SingleChildScrollView(
//               controller: _scrollController,
//               child: Column(
//                 children: [
//                   AutoScrollTag(
//                     key: ValueKey(0),
//                     controller: _scrollController,
//                     index: 0,
//                     child: HomeSection(
//                       key: _homeKey,
//                       onMoreAboutMePressed: () => _scrollToSection(1),
//                       onContactPressed: () => _scrollToSection(4),
//                       themeMode: widget.themeModeNotifier.value,
//                     ),
//                   ),
//                   AutoScrollTag(
//                     key: ValueKey(1),
//                     controller: _scrollController,
//                     index: 1,
//                     child: AboutSection(key: _aboutKey, themeMode: widget.themeModeNotifier.value),
//                   ),
//                   AutoScrollTag(
//                     key: ValueKey(2),
//                     controller: _scrollController,
//                     index: 2,
//                     child: SkillsAndExperienceSection(key: _skillsKey, themeMode: widget.themeModeNotifier.value),
//                   ),
//                   AutoScrollTag(
//                     key: ValueKey(3),
//                     controller: _scrollController,
//                     index: 3,
//                     child: ProjectSection(key: _projectsKey, themeMode: widget.themeModeNotifier.value),
//                   ),
//                   AutoScrollTag(
//                     key: ValueKey(4),
//                     controller: _scrollController,
//                     index: 4,
//                     child: ContactSection(key: _contactKey, themeMode: widget.themeModeNotifier.value),
//                   ),
//                   FooterSection(themeMode: widget.themeModeNotifier.value),
//                 ],
//               ),
//             ),
//           ),
//
//           // Left Sidebar Menu
//           // Left Sidebar Menu
//           if (isDesktop) // Only desktop
//             AnimatedPositioned(
//               duration: const Duration(milliseconds: 300),
//               left: _showLeftSidebar ? 0 : -200,
//               top: 0,
//               bottom: 0,
//               width: 200,
//               child: LeftSidebarMenu(
//                 selectedIndex: _currentSectionIndex,
//                 onItemSelected: _scrollToSection,
//                 sectionTitles: _sectionTitles,
//                 themeMode: widget.themeModeNotifier.value,
//                 onToggleTheme: () {
//                   widget.themeModeNotifier.value =
//                   isDarkTheme ? ThemeMode.light : ThemeMode.dark;
//                 },
//               ),
//             ),
//
//
//           // Right Circular Icon Menu (Always Fixed)
//           Align(
//             alignment: Alignment.centerRight,
//             child: FixedRightCircularMenu(
//               selectedIndex: _currentSectionIndex,
//               onItemSelected: _scrollToSection,
//               themeMode: widget.themeModeNotifier.value,
//               onToggleTheme: () {
//                 widget.themeModeNotifier.value =
//                 isDarkTheme ? ThemeMode.light : ThemeMode.dark;
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
