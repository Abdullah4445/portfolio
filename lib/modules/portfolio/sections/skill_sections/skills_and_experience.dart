import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/portfolio/sections/skill_sections/widgets/personal_skillbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'section_header.dart';
import 'widgets/circular_skill_indicator.dart';
import 'widgets/education_entry.dart';

class SkillsAndExperienceSection extends StatelessWidget {
  const SkillsAndExperienceSection({Key? key, required this.themeMode})
      : super(key: key);

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool isDarkMode = brightness == Brightness.dark;
    final Color primaryColor = Colors.orange;
    final Color accentColor = isDarkMode ? Colors.blueAccent : Colors.blue.shade700;

    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
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
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(
          color: isDarkMode ? Colors.grey[700]! : Colors.grey[200]!,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryColor, Colors.deepOrange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skills & Experience',
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: isDarkMode ? Colors.white : Colors.black87,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Where Talent Meets Technology',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: isDarkMode ? Colors.white60 : Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 700) {
                return _buildSingleColumnLayout(context, isDarkMode, primaryColor);
              } else {
                return _buildTwoColumnLayout(context, isDarkMode, primaryColor);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSingleColumnLayout(BuildContext context, bool isDarkMode, Color primaryColor) {
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color secondaryTextColor = isDarkMode ? Colors.grey[300]! : Colors.grey[700]!;
    final Color tertiaryTextColor = isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Education Section
        _buildEducationSection(textColor, secondaryTextColor, tertiaryTextColor),

        const SizedBox(height: 40),

        // Skills Sections
        _buildSkillsSections(isDarkMode, textColor),
      ],
    );
  }

  Widget _buildTwoColumnLayout(BuildContext context, bool isDarkMode, Color primaryColor) {
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color secondaryTextColor = isDarkMode ? Colors.grey[300]! : Colors.grey[700]!;
    final Color tertiaryTextColor = isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Education Column
        Expanded(
          flex: 3,
          child: _buildEducationSection(textColor, secondaryTextColor, tertiaryTextColor),
        ),

        const SizedBox(width: 40),

        // Skills Column
        Expanded(
          flex: 2,
          child: _buildSkillsSections(isDarkMode, textColor),
        ),
      ],
    );
  }

  Widget _buildEducationSection(Color textColor, Color secondaryTextColor, Color tertiaryTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEnhancedSectionHeader(
          icon: FontAwesomeIcons.graduationCap,
          title: 'Education Journey',
          subtitle: 'My Learning Path',
          color: Colors.deepOrange,
        ),
        const SizedBox(height: 24),

        EducationEntry(
          degree: 'Currently in 12th Class',
          university: 'Graduate College Degree (Ongoing)',
          years: 'Present',
          description: 'Focusing on core subjects and building foundational knowledge. Actively exploring career paths in technology.',
          textColor: textColor,
          secondaryTextColor: secondaryTextColor,
          tertiaryTextColor: tertiaryTextColor,
          icon: FontAwesomeIcons.bookOpen,
          gradientColors: [Colors.blue, Colors.lightBlue],
        ),
        const SizedBox(height: 20),

        EducationEntry(
          degree: 'Flutter Learning Journey',
          university: 'AiLab Solutions',
          years: 'Late 2023 - Present',
          description: 'Began learning Flutter in late 2023 at AiLab Solutions. Gained proficiency in Dart, UI/UX design, and building cross-platform mobile applications.',
          textColor: textColor,
          secondaryTextColor: secondaryTextColor,
          tertiaryTextColor: tertiaryTextColor,
          icon: FontAwesomeIcons.mobile,
          gradientColors: [Colors.green, Colors.lightGreen],
        ),
        const SizedBox(height: 20),

        EducationEntry(
          degree: 'Advanced Flutter Concepts',
          university: 'Continuous Learning',
          years: 'Ongoing',
          description: 'Continuously learning advanced Flutter topics including state management, animations, and performance optimization.',
          textColor: textColor,
          secondaryTextColor: secondaryTextColor,
          tertiaryTextColor: tertiaryTextColor,
          icon: FontAwesomeIcons.rocket,
          gradientColors: [Colors.purple, Colors.purpleAccent],
        ),
      ],
    );
  }

  Widget _buildSkillsSections(bool isDarkMode, Color textColor) {
    final Color progressBackgroundColor = isDarkMode ? Colors.grey[700]! : Colors.grey[200]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Personal Skills
        _buildEnhancedSectionHeader(
          icon: FontAwesomeIcons.userTie,
          title: 'Personal Skills',
          subtitle: 'Soft Skills & Attributes',
          color: Colors.blueAccent,
        ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[800]!.withOpacity(0.4) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              PersonalSkillBar(
                skillName: 'Time Management',
                progress: 0.9,
                textColor: textColor,
                progressBackgroundColor: progressBackgroundColor,
                icon: FontAwesomeIcons.clock,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              PersonalSkillBar(
                skillName: 'Adaptability',
                progress: 0.85,
                textColor: textColor,
                progressBackgroundColor: progressBackgroundColor,
                icon: FontAwesomeIcons.arrowsRotate,
                color: Colors.orange,
              ),
              const SizedBox(height: 16),
              PersonalSkillBar(
                skillName: 'Teamwork',
                progress: 0.95,
                textColor: textColor,
                progressBackgroundColor: progressBackgroundColor,
                icon: FontAwesomeIcons.peopleGroup,
                color: Colors.blue,
              ),
              const SizedBox(height: 16),
              PersonalSkillBar(
                skillName: 'Communication',
                progress: 0.88,
                textColor: textColor,
                progressBackgroundColor: progressBackgroundColor,
                icon: FontAwesomeIcons.comments,
                color: Colors.purple,
              ),
            ],
          ),
        ),

        const SizedBox(height: 40),

        // Technical Skills
        _buildEnhancedSectionHeader(
          icon: FontAwesomeIcons.code,
          title: 'Technical Skills',
          subtitle: 'Programming & Tools',
          color: Colors.green,
        ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[800]!.withOpacity(0.4) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              // First Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularSkillIndicator(
                    skillName: 'Flutter',
                    percentage: 85,
                    colors: const [Colors.blue, Colors.lightBlueAccent, Colors.cyan],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                    icon: FontAwesomeIcons.mobile,
                  ),
                  CircularSkillIndicator(
                    skillName: 'Dart',
                    percentage: 90,
                    colors: const [Colors.teal, Colors.greenAccent, Colors.lightGreen],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                    icon: FontAwesomeIcons.code,
                  ),
                  CircularSkillIndicator(
                    skillName: 'Firebase',
                    percentage: 75,
                    colors: const [Colors.orange, Colors.deepOrangeAccent, Colors.redAccent],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                    icon: FontAwesomeIcons.fire,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularSkillIndicator(
                    skillName: 'REST APIs',
                    percentage: 80,
                    colors: const [Colors.purple, Colors.deepPurpleAccent, Colors.pink],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                    icon: FontAwesomeIcons.cloud,
                  ),
                  CircularSkillIndicator(
                    skillName: 'Git',
                    percentage: 88,
                    colors: const [Colors.grey, Colors.blueGrey, Colors.black54],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                    icon: FontAwesomeIcons.gitAlt,
                  ),
                  CircularSkillIndicator(
                    skillName: 'UI/UX',
                    percentage: 70,
                    colors: const [Colors.amber, Colors.yellowAccent, Colors.lime],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                    icon: FontAwesomeIcons.paintBrush,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEnhancedSectionHeader({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    final bool isDarkMode = themeMode == ThemeMode.dark;

    return Row(
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
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
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
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? Colors.white60 : Colors.black54,
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