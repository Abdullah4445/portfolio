import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutIntro extends StatelessWidget {
  final ThemeMode themeMode;
  const AboutIntro({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeMode == ThemeMode.dark;
    final bool isTablet = ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET);
    final Color primaryColor = Colors.orange;
    final Color secondaryColor = isDark ? Colors.blueAccent : Colors.blue;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
            Colors.grey[900]!,
            Colors.grey[850]!,
            Colors.grey[900]!,
          ]
              : [
            Colors.white,
            Colors.grey[50]!,
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, primaryColor.withOpacity(0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person_outline_rounded,
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
                      "ABOUT ME",
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 14 : 12,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "I'm Abdullah – Flutter Developer / App Designer",
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 22 : 18,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : Colors.black87,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Main content with improved styling
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[800]!.withOpacity(0.3) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? Colors.grey[700]! : Colors.grey[100]!,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "I am a passionate Flutter Developer from Pakistan, specializing in creating responsive mobile and web applications. "
                      "I work with Firebase, REST APIs, real-time chat, authentication, and Bluetooth thermal printing solutions. "
                      "My goal is to build modern and polished apps with professional user interfaces and smooth functionality.",
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 16 : 14,
                    color: isDark ? Colors.white70 : Colors.black54,
                    height: 1.7,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Skills highlights
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildSkillChip("Flutter", FontAwesomeIcons.mobile, primaryColor),
              _buildSkillChip("Firebase", FontAwesomeIcons.fireFlameCurved, Colors.orange),
              _buildSkillChip("REST APIs", FontAwesomeIcons.code, Colors.green),
              _buildSkillChip("UI/UX Design", FontAwesomeIcons.paintBrush, Colors.purple),
              _buildSkillChip("Bluetooth", FontAwesomeIcons.bluetooth, Colors.blue),
              _buildSkillChip("Authentication", FontAwesomeIcons.shieldAlt, Colors.red),
            ],
          ),

          const SizedBox(height: 16),

          // Mission statement
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: primaryColor.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.rocket_launch_rounded,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Building the future, one app at a time! 🚀",
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 14 : 12,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white70 : Colors.black87,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 14,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}