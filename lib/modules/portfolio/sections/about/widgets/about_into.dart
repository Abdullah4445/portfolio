import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutIntro extends StatelessWidget {
  final ThemeMode themeMode;
  const AboutIntro({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeMode == ThemeMode.dark;
    final bool isTablet = ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm Abdullah – Flutter Developer / App Designer",
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 24 : 18,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "I am a passionate Flutter Developer from Pakistan, specializing in creating responsive mobile and web applications. "
              "I work with Firebase, REST APIs, real-time chat, authentication, and Bluetooth thermal printing solutions. "
              "My goal is to build modern and polished apps with professional user interfaces and smooth functionality.",
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 16 : 14,
            color: isDark ? Colors.white60 : Colors.black54,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
