// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'heropainter.dart'; // Is file me HeroBoxWithAnimatedIcons hai
//
// class HomeSection extends StatelessWidget {
//   final VoidCallback onMoreAboutMePressed;
//   final VoidCallback onContactPressed;
//   final ThemeMode themeMode;
//
//   const HomeSection({
//     Key? key,
//     required this.onMoreAboutMePressed,
//     required this.onContactPressed,
//     required this.themeMode,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final bool isDark = themeMode == ThemeMode.dark;
//
//     final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
//     final bool isTablet = ResponsiveBreakpoints.of(context).isTablet;
//
//     final Color primaryTextColor = isDark ? Colors.white : Colors.black;
//     final Color secondaryTextColor =
//     isDark ? Colors.white70 : Colors.grey[700]!;
//     final Color backgroundColor =
//     isDark ? Colors.grey[900]! : Colors.grey[200]!;
//     final Color designationButtonColor =
//     isDark ? Colors.blueGrey[800]! : Colors.black;
//     final Color moreAboutMeButtonColor = Colors.orange;
//
//     final double introFontSize = ResponsiveValue(context,
//         defaultValue: 48.0,
//         conditionalValues: [
//           Condition.equals(name: MOBILE, value: 30.0),
//           Condition.equals(name: TABLET, value: 40.0),
//         ]).value!;
//     final double designationFontSize = ResponsiveValue(context,
//         defaultValue: 14.0,
//         conditionalValues: [
//           Condition.equals(name: MOBILE, value: 12.0),
//         ]).value!;
//     final double moreAboutMeButtonPadding = ResponsiveValue(context,
//         defaultValue: 30.0,
//         conditionalValues: [
//           Condition.equals(name: MOBILE, value: 20.0),
//         ]).value!;
//     final double moreAboutMeButtonVerticalPadding = ResponsiveValue(context,
//         defaultValue: 15.0,
//         conditionalValues: [
//           Condition.equals(name: MOBILE, value: 12.0),
//         ]).value!;
//
//     final double mobilePhotoSize = screenWidth * 0.45;
//     final double desktopPhotoSize = screenWidth * 0.25;
//
//     return Container(
//       height: screenHeight,
//       width: screenWidth,
//       color: backgroundColor,
//       child: isMobile || isTablet
//           ? SingleChildScrollView(
//         padding:
//         const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             // Hero Box With Animated Icons for Mobile/Tablet
//             HeroBoxWithAnimatedIcons(
//               themeMode: themeMode,
//               size: mobilePhotoSize,
//             ),
//             const SizedBox(height: 20),
//             _buildTextsAndButtons(
//               context,
//               introFontSize,
//               primaryTextColor,
//               secondaryTextColor,
//               designationButtonColor,
//               designationFontSize,
//               moreAboutMeButtonColor,
//               moreAboutMeButtonPadding,
//               moreAboutMeButtonVerticalPadding,
//             ),
//           ],
//         ),
//       )
//           : // Desktop Layout
//       Stack(
//         children: [
//           // Left Side Text
//           Positioned(
//             left: screenWidth * 0.1,
//             top: screenHeight * 0.3,
//             child: _buildTextsAndButtons(
//               context,
//               introFontSize,
//               primaryTextColor,
//               secondaryTextColor,
//               designationButtonColor,
//               designationFontSize,
//               moreAboutMeButtonColor,
//               moreAboutMeButtonPadding,
//               moreAboutMeButtonVerticalPadding,
//             ),
//           ),
//           // Right Side Hero Box with Animated Icons for Desktop
//           Positioned(
//             right: screenWidth * 0.1,
//             top: screenHeight * 0.15,
//             child: HeroBoxWithAnimatedIcons(
//               themeMode: themeMode,
//               size: desktopPhotoSize,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextsAndButtons(
//       BuildContext context,
//       double introFontSize,
//       Color primaryTextColor,
//       Color secondaryTextColor,
//       // Color designationButtonColor,
//       double designationFontSize,
//       Color moreAboutMeButtonColor,
//       double moreAboutMeButtonPadding,
//       double moreAboutMeButtonVerticalPadding) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "HI THERE!",
//           style: GoogleFonts.poppins(
//             fontSize: introFontSize * 0.5,
//             fontWeight: FontWeight.w600,
//             color: primaryTextColor,
//           ),
//         ),
//         Text(
//           "I'M ABDULLAH",
//           style: GoogleFonts.poppins(
//             fontSize: introFontSize,
//             fontWeight: FontWeight.w800,
//             color: primaryTextColor,
//           ),
//         ),
//         Text(
//           "PROGRAMMER",
//           style: GoogleFonts.poppins(
//             fontSize: introFontSize * 0.75,
//             fontWeight: FontWeight.w600,
//             color: Colors.orange,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Wrap(
//           spacing: 10.0,
//           runSpacing: 10.0,
//           children: [
//             _buildDesignationButton(
//                 "WEB DEVELOPER", designationButtonColor, designationFontSize),
//             _buildDesignationButton(
//                 "UI/UX DESIGNER", designationButtonColor, designationFontSize),
//             _buildDesignationButton("SOFTWARE ENGINEER", designationButtonColor,
//                 designationFontSize),
//           ],
//         ),
//         const SizedBox(height: 30),
//         ElevatedButton(
//           onPressed: onMoreAboutMePressed,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: moreAboutMeButtonColor,
//             foregroundColor: Colors.white,
//             padding: EdgeInsets.symmetric(
//                 horizontal: moreAboutMeButtonPadding,
//                 vertical: moreAboutMeButtonVerticalPadding),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           child: Text(
//             "MORE ABOUT ME",
//             style: GoogleFonts.poppins(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         TextButton(
//           onPressed: onContactPressed,
//           child: Text(
//             "Ready to handle your new project",
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               color: secondaryTextColor,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDesignationButton(String text, Color bgColor, double fontSize) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         text,
//         style: GoogleFonts.poppins(
//           fontSize: fontSize,
//           color: Colors.white,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }
