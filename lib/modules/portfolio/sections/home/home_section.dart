import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/portfolio/sections/home/widgets/intro_text.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'widgets/hero_box.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback onMoreAboutMePressed;
  final VoidCallback onContactPressed;
  final ThemeMode themeMode;

  const HomeSection({
    Key? key,
    required this.onMoreAboutMePressed,
    required this.onContactPressed,
    required this.themeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDark = themeMode == ThemeMode.dark;

    final bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final bool isTablet = ResponsiveBreakpoints.of(context).isTablet;

    final Color backgroundColor =
    isDark ? Colors.grey[900]! : Colors.grey[200]!;

    final double mobilePhotoSize = screenWidth * 0.45;
    final double desktopPhotoSize = screenWidth * 0.25;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: backgroundColor,
      child: isMobile || isTablet
          ? SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeroBox(themeMode: themeMode, size: mobilePhotoSize),
            const SizedBox(height: 20),
            IntroTexts(
              themeMode: themeMode,
              onMoreAboutMePressed: onMoreAboutMePressed,
              onContactPressed: onContactPressed,
            ),
          ],
        ),
      )
          : Stack(
        children: [
          // Left Side Text
          Positioned(
            left: screenWidth * 0.1,
            top: screenHeight * 0.3,
            child: IntroTexts(
              themeMode: themeMode,
              onMoreAboutMePressed: onMoreAboutMePressed,
              onContactPressed: onContactPressed,
            ),
          ),
          // Right Side Hero Box
          Positioned(
            right: screenWidth * 0.1,
            top: screenHeight * 0.15,
            child: HeroBox(themeMode: themeMode, size: desktopPhotoSize),
          ),
        ],
      ),
    );
  }
}
