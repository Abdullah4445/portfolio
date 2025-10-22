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
    final Color moreAboutMeButtonColor = Colors.orange;

    final double introFontSize = ResponsiveValue(context,
        defaultValue: 48.0,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 30.0),
          Condition.equals(name: TABLET, value: 40.0),
        ]).value!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HI THERE!",
          style: GoogleFonts.poppins(
            fontSize: introFontSize * 0.5,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
          ),
        ),
        Text(
          "I'M ABDULLAH",
          style: GoogleFonts.poppins(
            fontSize: introFontSize,
            fontWeight: FontWeight.w800,
            color: primaryTextColor,
          ),
        ),
        Text(
          "PROGRAMMER",
          style: GoogleFonts.poppins(
            fontSize: introFontSize * 0.75,
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        const SizedBox(height: 20),

        // Designation Buttons
        DesignationButtons(color: designationButtonColor),

        const SizedBox(height: 30),

        ElevatedButton(
          onPressed: () => openUrl('https://wa.me/923017832945'),
          style: ElevatedButton.styleFrom(
            backgroundColor: moreAboutMeButtonColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                "Whatsapp Me",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: onContactPressed,
          child: Text(
            "Ready to handle your new project",
            style: GoogleFonts.poppins(fontSize: 14, color: secondaryTextColor),
          ),
        ),
      ],
    );
  }
}
