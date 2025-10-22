import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/portfolio/contact/widgets/contact_form.dart';
import 'package:portfolio/modules/portfolio/contact/widgets/contact_info.dart';
import 'package:responsive_framework/responsive_framework.dart';


class ContactSection extends StatelessWidget {
  final ThemeMode themeMode;

  const ContactSection({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;
    final bool isDesktop =
    ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);

    final Color textColor = isDark ? Colors.white70 : Colors.black87;
    final Color backgroundColor =
    isDark ? Colors.grey[900]! : Colors.grey[100]!;

    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isDesktop ? 80 : 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact Me",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 40 : 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 30),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: ContactForm(textColor: textColor)),
                const SizedBox(width: 40),
                Expanded(child: ContactInfo(textColor: textColor)),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactForm(textColor: textColor),
                const SizedBox(height: 40),
                ContactInfo(textColor: textColor),
              ],
            ),
        ],
      ),
    );
  }
}