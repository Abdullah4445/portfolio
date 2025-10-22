import 'package:flutter/material.dart';
import 'package:portfolio/modules/portfolio/sections/skill_sections/widgets/personal_skillbar.dart';

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

    final Color backgroundColor = isDarkMode ? Colors.grey[900]! : Colors.white;
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color secondaryTextColor =
    isDarkMode ? Colors.grey[300]! : Colors.grey[700]!;
    final Color tertiaryTextColor =
    isDarkMode ? Colors.grey[400]! : Colors.grey[600]!;
    final Color shadowColor =
    isDarkMode ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.1);
    final Color progressBackgroundColor =
    isDarkMode ? Colors.grey[700]! : Colors.grey[200]!;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Combination of Skill & Experience',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 700) {
                return _buildSingleColumnLayout(
                    context,
                    textColor,
                    secondaryTextColor,
                    tertiaryTextColor,
                    progressBackgroundColor);
              } else {
                return _buildTwoColumnLayout(
                    context,
                    textColor,
                    secondaryTextColor,
                    tertiaryTextColor,
                    progressBackgroundColor);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSingleColumnLayout(
      BuildContext context,
      Color textColor,
      Color secondaryTextColor,
      Color tertiaryTextColor,
      Color progressBackgroundColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              icon: Icons.school,
              title: 'Education',
              color: Colors.deepOrange,
              textColor: textColor,
            ),
            const SizedBox(height: 20),
            EducationEntry(
              degree: 'Currently in 12th Class',
              university: 'Graduate College Degree  (Ongoing)',
              years: 'Present',
              description:
              'Focusing on core subjects and building foundational knowledge. Actively exploring career paths in technology.',
              textColor: textColor,
              secondaryTextColor: secondaryTextColor,
              tertiaryTextColor: tertiaryTextColor,
            ),
            const SizedBox(height: 24),
            EducationEntry(
              degree: 'Flutter Learning Journey',
              university: 'AiLab Solutions',
              years: 'Late 2023 - Present',
              description:
              'Began learning Flutter in late 2023 at AiLab Solutions. Gained proficiency in Dart, UI/UX design, and building cross-platform mobile applications.',
              textColor: textColor,
              secondaryTextColor: secondaryTextColor,
              tertiaryTextColor: tertiaryTextColor,
            ),
            const SizedBox(height: 24),
            EducationEntry(
              degree: 'Advanced Flutter Concepts',
              university: 'Continuous Learning',
              years: 'Ongoing',
              description:
              'Continuously learning advanced Flutter topics including state management, animations, and performance optimization.',
              textColor: textColor,
              secondaryTextColor: secondaryTextColor,
              tertiaryTextColor: tertiaryTextColor,
            ),
          ],
        ),
        const SizedBox(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              icon: Icons.person,
              title: 'Personal Skills',
              color: Colors.blueAccent,
              textColor: textColor,
            ),
            const SizedBox(height: 20),
            PersonalSkillBar(
              skillName: 'Time Management',
              progress: 0.9,
              textColor: textColor,
              progressBackgroundColor: progressBackgroundColor,
            ),
            PersonalSkillBar(
              skillName: 'Adaptability',
              progress: 0.85,
              textColor: textColor,
              progressBackgroundColor: progressBackgroundColor,
            ),
            PersonalSkillBar(
              skillName: 'Teamwork',
              progress: 0.95,
              textColor: textColor,
              progressBackgroundColor: progressBackgroundColor,
            ),
            PersonalSkillBar(
              skillName: 'Communication',
              progress: 0.88,
              textColor: textColor,
              progressBackgroundColor: progressBackgroundColor,
            ),
            const SizedBox(height: 40),
            SectionHeader(
              icon: Icons.code,
              title: 'Software Skills',
              color: Colors.green,
              textColor: textColor,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularSkillIndicator(
                  skillName: 'Flutter',
                  percentage: 85,
                  colors: const [
                    Colors.blue,
                    Colors.lightBlueAccent,
                    Colors.cyan,
                  ],
                  textColor: textColor,
                  progressBackgroundColor: progressBackgroundColor,
                ),
                CircularSkillIndicator(
                  skillName: 'Dart',
                  percentage: 90,
                  colors: const [
                    Colors.teal,
                    Colors.greenAccent,
                    Colors.lightGreen,
                  ],
                  textColor: textColor,
                  progressBackgroundColor: progressBackgroundColor,
                ),
                CircularSkillIndicator(
                  skillName: 'Firebase',
                  percentage: 75,
                  colors: const [
                    Colors.orange,
                    Colors.deepOrangeAccent,
                    Colors.redAccent,
                  ],
                  textColor: textColor,
                  progressBackgroundColor: progressBackgroundColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularSkillIndicator(
                  skillName: 'REST APIs',
                  percentage: 80,
                  colors: const [
                    Colors.purple,
                    Colors.deepPurpleAccent,
                    Colors.pink,
                  ],
                  textColor: textColor,
                  progressBackgroundColor: progressBackgroundColor,
                ),
                CircularSkillIndicator(
                  skillName: 'Git',
                  percentage: 88,
                  colors: const [
                    Colors.grey,
                    Colors.blueGrey,
                    Colors.black54,
                  ],
                  textColor: textColor,
                  progressBackgroundColor: progressBackgroundColor,
                ),
                CircularSkillIndicator(
                  skillName: 'UI/UX Design',
                  percentage: 70,
                  colors: const [
                    Colors.amber,
                    Colors.yellowAccent,
                    Colors.lime,
                  ],
                  textColor: textColor,
                  progressBackgroundColor: progressBackgroundColor,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTwoColumnLayout(
      BuildContext context,
      Color textColor,
      Color secondaryTextColor,
      Color tertiaryTextColor,
      Color progressBackgroundColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                icon: Icons.school,
                title: 'Education',
                color: Colors.deepOrange,
                textColor: textColor,
              ),
              const SizedBox(height: 20),
              EducationEntry(
                degree: 'Currently in 12th Class',
                university: 'Graduate College Degree (Ongoing)',
                years: 'Present',
                description:
                'Focusing on core subjects and building foundational knowledge. Actively exploring career paths in technology.',
                textColor: textColor,
                secondaryTextColor: secondaryTextColor,
                tertiaryTextColor: tertiaryTextColor,
              ),
              const SizedBox(height: 24),
              EducationEntry(
                degree: 'Flutter Learning Journey',
                university: 'AiLab Solutions',
                years: 'Late 2023 - Present',
                description:
                'Began learning Flutter in late 2023 at AiLab Solutions. Gained proficiency in Dart, UI/UX design, and building cross-platform mobile applications.',
                textColor: textColor,
                secondaryTextColor: secondaryTextColor,
                tertiaryTextColor: tertiaryTextColor,
              ),
              const SizedBox(height: 24),
              EducationEntry(
                degree: 'Advanced Flutter Concepts',
                university: 'Continuous Learning',
                years: 'Ongoing',
                description:
                'Continuously learning advanced Flutter topics including state management, animations, and performance optimization.',
                textColor: textColor,
                secondaryTextColor: secondaryTextColor,
                tertiaryTextColor: tertiaryTextColor,
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                icon: Icons.person,
                title: 'Personal Skills',
                color: Colors.blueAccent,
                textColor: textColor,
              ),
              const SizedBox(height: 20),
              PersonalSkillBar(
                skillName: 'Time Management',
                progress: 0.9,
                textColor: textColor,
                progressBackgroundColor: progressBackgroundColor,
              ),
              PersonalSkillBar(
                skillName: 'Adaptability',
                progress: 0.85,
                textColor: textColor,
                progressBackgroundColor: progressBackgroundColor,
              ),
              PersonalSkillBar(
                skillName: 'Teamwork',
                progress: 0.95,
                textColor: textColor,
                progressBackgroundColor: progressBackgroundColor,
              ),
              PersonalSkillBar(
                skillName: 'Communication',
                progress: 0.88,
                textColor: textColor,
                progressBackgroundColor: progressBackgroundColor,
              ),
              const SizedBox(height: 40),
              SectionHeader(
                icon: Icons.code,
                title: 'Software Skills',
                color: Colors.green,
                textColor: textColor,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularSkillIndicator(
                    skillName: 'Flutter',
                    percentage: 85,
                    colors: const [
                      Colors.blue,
                      Colors.lightBlueAccent,
                      Colors.cyan,
                    ],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                  ),
                  CircularSkillIndicator(
                    skillName: 'Dart',
                    percentage: 90,
                    colors: const [
                      Colors.teal,
                      Colors.greenAccent,
                      Colors.lightGreen,
                    ],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                  ),
                  CircularSkillIndicator(
                    skillName: 'Firebase',
                    percentage: 75,
                    colors: const [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                      Colors.redAccent,
                    ],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularSkillIndicator(
                    skillName: 'REST APIs',
                    percentage: 80,
                    colors: const [
                      Colors.purple,
                      Colors.deepPurpleAccent,
                      Colors.pink,
                    ],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                  ),
                  CircularSkillIndicator(
                    skillName: 'Git',
                    percentage: 88,
                    colors: const [
                      Colors.grey,
                      Colors.blueGrey,
                      Colors.black54,
                    ],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                  ),
                  CircularSkillIndicator(
                    skillName: 'UI/UX Design',
                    percentage: 70,
                    colors: const [
                      Colors.amber,
                      Colors.yellowAccent,
                      Colors.lime,
                    ],
                    textColor: textColor,
                    progressBackgroundColor: progressBackgroundColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}