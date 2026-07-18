import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/portfolio/contact/widgets/contact_form.dart';
import 'package:portfolio/modules/portfolio/contact/widgets/contact_info.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/liquid_glass.dart';


class ContactSection extends StatelessWidget {
  final ThemeMode themeMode;

  const ContactSection({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = themeMode == ThemeMode.dark;
    final bool isDesktop =
    ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);

    final Color textColor = isDark ? Colors.white : Colors.black87;

    Widget glassPanel(Widget child) => LiquidGlass(
          isDark: isDark,
          borderRadius: 24,
          padding: const EdgeInsets.all(28),
          child: child,
        );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [Colors.white.withOpacity(0.02), Colors.black.withOpacity(0.10)]
              : [Colors.white.withOpacity(0.10), Colors.white.withOpacity(0.30)],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: isDesktop ? 80 : 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.orange, Colors.deepOrange],
            ).createShader(bounds),
            child: Text(
              "Contact Me",
              style: GoogleFonts.poppins(
                fontSize: isDesktop ? 40 : 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          if (isDesktop)
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: glassPanel(ContactForm(textColor: textColor))),
                  const SizedBox(width: 24),
                  Expanded(child: glassPanel(ContactInfo(textColor: textColor))),
                ],
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                glassPanel(ContactForm(textColor: textColor)),
                const SizedBox(height: 24),
                glassPanel(ContactInfo(textColor: textColor)),
              ],
            ),
        ],
      ),
    );
  }
}