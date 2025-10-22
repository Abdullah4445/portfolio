import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/portfolio/project/widgets/project_cards.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../models/project_model.dart';
import 'logics/github_auth.dart';

class ProjectSection extends StatefulWidget {
  final ThemeMode themeMode;

  const ProjectSection({Key? key, required this.themeMode}) : super(key: key);

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  late Future<List<Project>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    _projectsFuture = _loadProjects(); // ✅ sirf ek dafa call
  }

  Future<List<Project>> _loadProjects() async {
    // ✅ Custom static projects (tum manually add karna chaho to yahan karo)
    final List<Project> staticProjects = [
      Project(
        title: "Custom Portfolio",
        description: "Flutter portfolio app showcasing my skills.",
        imageUrl:
        "https://images.unsplash.com/photo-1611162617474-5b21e879e113?auto=format&fit=crop&w=800&q=60",
        projectUrl: "https://github.com/Abdullah4445/myportfolio",
      ),
    ];

    // ✅ GitHub repos fetch karo
    final githubProjects =
    await GithubService(username: "Abdullah4445").fetchRepos();

    // ✅ Combine karo dono lists
    return [...staticProjects, ...githubProjects];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeMode == ThemeMode.dark;
    final bool isDesktop =
    ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);

    final Color textColor = isDark ? Colors.white70 : Colors.black87;
    final Color backgroundColor =
    isDark ? Colors.grey[900]! : Colors.grey[100]!;

    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 24,
        vertical: isDesktop ? 80 : 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 40 : 28,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 40),

          // ✅ SAFE FutureBuilder
          FutureBuilder<List<Project>>(
            future: _projectsFuture, // 👈 yahan sirf ek dafa assign hua
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text(
                  "Failed to load projects: ${snapshot.error}",
                  style: TextStyle(color: textColor),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text(
                  "No projects found",
                  style: TextStyle(color: textColor),
                );
              }

              final projects = snapshot.data!;

              return CarouselSlider(
                options: CarouselOptions(
                  height: isDesktop ? 420 : 340,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: isDesktop ? 0.4 : 0.8,
                ),
                items: projects.map((project) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ProjectCard(
                        project: project,
                        textColor: textColor,
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
