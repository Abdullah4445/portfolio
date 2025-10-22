import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/portfolio/sections/about/widgets/about_into.dart';
import 'package:portfolio/modules/portfolio/sections/about/widgets/about_service_and_facts.dart';
import 'package:responsive_framework/responsive_framework.dart';


class AboutSection extends StatelessWidget {
  final ThemeMode themeMode;
  const AboutSection({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);
    final bool isDark = themeMode == ThemeMode.dark;
    final Color backgroundColor = isDark ? Colors.grey[900]! : Colors.grey[100]!;

    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 24,
        vertical: isDesktop ? 80 : 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "About Me",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 40 : 28,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 30),

          // Intro
          AboutIntro(themeMode: themeMode),

          const SizedBox(height: 40),

          // Services + Fun Facts
          AboutServicesAndFacts(themeMode: themeMode),
        ],
      ),
    );
  }
}
