import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fun_facts.dart';
import 'service_card.dart';

class AboutServicesAndFacts extends StatelessWidget {
  final ThemeMode themeMode;
  const AboutServicesAndFacts({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeMode == ThemeMode.dark;
    final Color textColor = isDark ? Colors.white70 : Colors.black87;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Services
        Text(
          "What I Do?",
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 20),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: const [
            ServiceCard(
              title: 'Flutter Apps',
              description:
              'I develop modern and high-performance cross-platform apps using Flutter for Android, iOS, and Web.',
              icon: Icons.phone_android,
              themeMode: ThemeMode.light, // Will be overridden in AboutSection
            ),
            ServiceCard(
              title: 'Firebase Integration',
              description:
              'I integrate real-time databases, authentication, cloud storage, and notifications using Firebase.',
              icon: Icons.cloud_outlined,
              themeMode: ThemeMode.light,
            ),
            ServiceCard(
              title: 'UI/UX Design',
              description:
              'I create polished and responsive app UIs with professional animations and modern layouts.',
              icon: Icons.design_services,
              themeMode: ThemeMode.light,
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Fun Facts
        Text(
          "Fun Facts",
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 20),

        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            FunFactCard(number: '1+', text: 'Years\nExperience', icon: Icons.history),
            FunFactCard(number: '4+', text: 'Projects\nCompleted', icon: Icons.task_alt),
            FunFactCard(number: '100%', text: 'Client\nSatisfaction', icon: Icons.star),
            FunFactCard(number: '1k+', text: 'Lines of\nFlutter Code', icon: Icons.code_outlined),
          ],
        ),
      ],
    );
  }
}
