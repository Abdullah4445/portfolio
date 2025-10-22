import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/portfolio/project/widgets/project_cards.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/project_model.dart';
import '../../widgets/url_launcher.dart';
import 'logics/github_auth.dart';

class ProjectSection extends StatefulWidget {
  final ThemeMode themeMode;

  const ProjectSection({Key? key, required this.themeMode}) : super(key: key);

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  late Future<List<Project>> _projectsFuture;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _projectsFuture = _loadProjects();
  }

  Future<List<Project>> _loadProjects() async {
    final githubProjects = await GithubService(username: "Abdullah4445").fetchRepos();

    // GitHub data ko professionally format karo
    return githubProjects.map((project) {
      return Project(
        title: _formatProjectTitle(project.title),
        description: _formatProjectDescription(project.description ?? ''),
        imageUrl: project.imageUrl,
        projectUrl: project.projectUrl,
        techStack: _extractTechStack(project.description ?? ''),
        // stars: project.stars,
        // forks: project.forks,
        // language: project.language,
      );
    }).toList();
  }

  String _formatProjectTitle(String title) {
    // Remove special characters and format title
    String formatted = title.replaceAll('-', ' ').replaceAll('_', ' ');

    // Capitalize first letter of each word
    List<String> words = formatted.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }

    return words.join(' ');
  }

  String _formatProjectDescription(String description) {
    if (description.isEmpty || description.toLowerCase() == 'no description available') {
      return 'A Flutter project showcasing modern development practices and clean code architecture.';
    }

    // Remove common GitHub description patterns
    String formatted = description
        .replaceAll(RegExp(r'^[Ff]lutter\s*'), '')
        .replaceAll(RegExp(r'^[Dd]art\s*'), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    // Capitalize first letter
    if (formatted.isNotEmpty) {
      formatted = formatted[0].toUpperCase() + formatted.substring(1);
    }

    // Ensure proper sentence ending
    if (!formatted.endsWith('.') && !formatted.endsWith('!')) {
      formatted += '.';
    }

    return formatted;
  }

  List<String> _extractTechStack(String description) {
    List<String> techStack = [];

    // Common Flutter tech stack detection
    if (description.toLowerCase().contains('flutter')) techStack.add('Flutter');
    if (description.toLowerCase().contains('dart')) techStack.add('Dart');
    if (description.toLowerCase().contains('firebase')) techStack.add('Firebase');
    if (description.toLowerCase().contains('api')) techStack.add('REST API');
    if (description.toLowerCase().contains('sql')) techStack.add('SQL');
    if (description.toLowerCase().contains('provider')) techStack.add('Provider');
    if (description.toLowerCase().contains('bloc')) techStack.add('BLoC');
    if (description.toLowerCase().contains('getx')) techStack.add('GetX');

    // Default tech stack for Flutter projects
    if (techStack.isEmpty) {
      techStack.addAll(['Flutter', 'Dart', 'Firebase']);
    }

    return techStack.take(3).toList(); // Max 3 technologies show karo
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeMode == ThemeMode.dark;
    final bool isDesktop = ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);
    final bool isTablet = ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET);

    final Color primaryColor = Colors.orange;
    final Color accentColor = isDark ? Colors.blueAccent : Colors.blue.shade700;

    return Container(
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
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : isTablet ? 60 : 24,
        vertical: isDesktop ? 100 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Premium Header
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
                  Icons.work_outline_rounded,
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
                      'My Projects',
                      style: GoogleFonts.poppins(
                        fontSize: isDesktop ? 48 : 36,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : Colors.black87,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Professional Flutter Applications & Solutions',
                      style: GoogleFonts.poppins(
                        fontSize: isDesktop ? 18 : 16,
                        fontWeight: FontWeight.w400,
                        color: isDark ? Colors.white60 : Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Projects Carousel with Enhanced UI
          FutureBuilder<List<Project>>(
            future: _projectsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildLoadingState(isDark);
              } else if (snapshot.hasError) {
                return _buildErrorState(snapshot.error.toString(), isDark);
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return _buildEmptyState(isDark);
              }

              final projects = snapshot.data!;

              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: projects.length,
                    options: CarouselOptions(
                      height: isDesktop ? 520 : isTablet ? 470 : 420,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: projects.length > 1,
                      autoPlayInterval: const Duration(seconds: 4),
                      viewportFraction: isDesktop ? 0.32 : isTablet ? 0.6 : 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return ProjectCard(
                        project: projects[index],
                        themeMode: widget.themeMode, textColor: Colors.yellow,
                      );
                    },
                  ),

                  const SizedBox(height: 40),

                  // Project Info & Navigation
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[800]!.withOpacity(0.3) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Project Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                projects[_currentIndex].title,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: isDark ? Colors.white : Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                projects[_currentIndex].description,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: isDark ? Colors.white60 : Colors.black54,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 20),

                        // Navigation & Counter
                        Column(
                          children: [
                            // Custom Dots Indicator
                            if (projects.length > 1)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: projects.asMap().entries.map((entry) {
                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentIndex == entry.key
                                          ? primaryColor
                                          : isDark ? Colors.grey[600]! : Colors.grey[300]!,
                                      boxShadow: _currentIndex == entry.key
                                          ? [
                                        BoxShadow(
                                          color: primaryColor.withOpacity(0.4),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                          : null,
                                    ),
                                  );
                                }).toList(),
                              ),

                            const SizedBox(height: 8),

                            // Project Counter
                            Text(
                              'Project ${_currentIndex + 1} of ${projects.length}',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isDark ? Colors.white60 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 60),

          // Call to Action
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor.withOpacity(0.1), accentColor.withOpacity(0.05)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: primaryColor.withOpacity(0.3),
                width: 2,
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
                    FontAwesomeIcons.github,
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
                        "Explore More Projects",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Visit my GitHub to discover all my Flutter projects, contributions, and open-source work",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: isDark ? Colors.white70 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _launchGitHubProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(FontAwesomeIcons.arrowUpRightFromSquare, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        "View GitHub",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(bool isDark) {
    return Column(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800]! : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.orange,
                ),
                const SizedBox(height: 20),
                Text(
                  'Loading Professional Projects...',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(String error, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800]! : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.red.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: Colors.red,
            size: 60,
          ),
          const SizedBox(height: 20),
          Text(
            'Projects Temporarily Unavailable',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'GitHub repositories will load shortly',
            style: GoogleFonts.poppins(
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800]! : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.orange.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.inbox_rounded,
            color: Colors.orange,
            size: 60,
          ),
          const SizedBox(height: 20),
          Text(
            'Professional Projects Coming Soon',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'New Flutter projects are being developed and will appear here',
            style: GoogleFonts.poppins(
              color: isDark ? Colors.white60 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  void _launchGitHubProfile() {
    openUrl('https://github.com/Abdullah4445');
  }
}