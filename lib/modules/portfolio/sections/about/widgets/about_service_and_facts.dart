import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'fun_facts.dart';
import 'service_card.dart';

class AboutServicesAndFacts extends StatelessWidget {
  final ThemeMode themeMode;
  const AboutServicesAndFacts({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeMode == ThemeMode.dark;
    final Color primaryColor = Colors.orange;
    final Color accentColor = isDark ? Colors.blueAccent : Colors.blue.shade700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Services Section
        _buildSectionHeader(
          title: "My Services",
          subtitle: "Transforming Ideas into Digital Reality",
          icon: Icons.work_outline_rounded,
          color: primaryColor,
        ),

        const SizedBox(height: 32),

        // Services Grid
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: [
            ServiceCard(
              title: 'Flutter Development',
              description: 'Building high-performance cross-platform apps for Android, iOS, and Web with modern Flutter architecture.',
              icon: FontAwesomeIcons.mobileScreen,
              themeMode: themeMode,
              gradientColors: [primaryColor, Colors.deepOrange],
            ),
            ServiceCard(
              title: 'Firebase Integration',
              description: 'Seamless integration of real-time databases, authentication, cloud storage, and push notifications.',
              icon: FontAwesomeIcons.cloud,
              themeMode: themeMode,
              gradientColors: [Colors.blue, Colors.lightBlue],
            ),
            ServiceCard(
              title: 'UI/UX Design',
              description: 'Creating stunning, responsive interfaces with smooth animations and professional design principles.',
              icon: FontAwesomeIcons.paintBrush,
              themeMode: themeMode,
              gradientColors: [Colors.purple, Colors.purpleAccent],
            ),
          ],
        ),

        const SizedBox(height: 60),

        // Fun Facts Section
        _buildSectionHeader(
          title: "Achievements & Stats",
          subtitle: "Numbers That Tell My Story",
          icon: Icons.insights_rounded,
          color: accentColor,
        ),

        const SizedBox(height: 32),

        // Fun Facts Grid
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                Colors.grey[850]!.withOpacity(0.6),
                Colors.grey[900]!.withOpacity(0.8),
              ]
                  : [
                Colors.white,
                Colors.grey[50]!,
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.spaceEvenly,
            children: [
              FunFactCard(
                number: '1+',
                text: 'Years\nExperience',
                icon: FontAwesomeIcons.clock,
                color: primaryColor,
                themeMode: themeMode,
              ),
              FunFactCard(
                number: '4+',
                text: 'Projects\nCompleted',
                icon: FontAwesomeIcons.tasks,
                color: Colors.green,
                themeMode: themeMode,
              ),
              FunFactCard(
                number: '100%',
                text: 'Client\nSatisfaction',
                icon: FontAwesomeIcons.solidStar,
                color: Colors.amber,
                themeMode: themeMode,
              ),
              FunFactCard(
                number: '10k+',
                text: 'Lines of\nFlutter Code',
                icon: FontAwesomeIcons.code,
                color: Colors.blue,
                themeMode: themeMode,
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),

        // Call to Action
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor.withOpacity(0.1), accentColor.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: primaryColor.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ready to Start Your Project?",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Let's collaborate and bring your ideas to life with cutting-edge Flutter solutions",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader({required String title, required String subtitle, required IconData icon, required Color color}) {
    final bool isDark = themeMode == ThemeMode.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: isDark ? Colors.white : Colors.black87,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: isDark ? Colors.white60 : Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}