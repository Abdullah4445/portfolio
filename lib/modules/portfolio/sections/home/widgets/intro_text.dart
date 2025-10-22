import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../widgets/url_launcher.dart';
import 'designnation_buttons.dart';

class IntroTexts extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback onMoreAboutMePressed;
  final VoidCallback onContactPressed;

  const IntroTexts({
    Key? key,
    required this.themeMode,
    required this.onMoreAboutMePressed,
    required this.onContactPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeMode == ThemeMode.dark;
    final Color primaryTextColor = isDark ? Colors.white : Colors.black;
    final Color secondaryTextColor = isDark ? Colors.white70 : Colors.grey[700]!;
    final Color designationButtonColor = isDark ? Colors.blueGrey[800]! : Colors.black;
    final Color accentColor = Colors.orange;

    final double introFontSize = ResponsiveValue(context,
        defaultValue: 48.0,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 30.0),
          Condition.equals(name: TABLET, value: 40.0),
        ]).value!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Intro with better styling
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hi There with emoji
            Row(
              children: [
                Text(
                  "👋 ",
                  style: TextStyle(fontSize: introFontSize * 0.4),
                ),
                Text(
                  "HI THERE!",
                  style: GoogleFonts.poppins(
                    fontSize: introFontSize * 0.45,
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),

            // Name with gradient effect
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  accentColor,
                  isDark ? Colors.orangeAccent : Colors.deepOrange,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds),
              child: Text(
                "I'M ABDULLAH",
                style: GoogleFonts.poppins(
                  fontSize: introFontSize,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 5),

            // Programmer with animated style
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentColor.withOpacity(0.9),
                    accentColor.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                "PROGRAMMER",
                style: GoogleFonts.poppins(
                  fontSize: introFontSize * 0.35,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 25),

        // Designation Buttons with better spacing
        DesignationButtons(color: designationButtonColor),

        const SizedBox(height: 35),

        // WhatsApp Button with improved design
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => openUrl('https://wa.me/+923271774145'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "WhatsApp Me",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 15),

        // Project ready text with better styling
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onContactPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800]!.withOpacity(0.3) : Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.rocket_launch_rounded,
                    color: accentColor,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Ready to handle your new project",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: secondaryTextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: accentColor,
                    size: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}