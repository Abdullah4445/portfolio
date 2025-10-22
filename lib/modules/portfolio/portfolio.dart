import 'package:flutter/material.dart';
import 'package:portfolio/modules/portfolio/project/poject.dart';
import 'package:portfolio/modules/portfolio/sections/about/about_section.dart';
import 'package:portfolio/modules/portfolio/sections/home/home_section.dart';
import 'package:portfolio/modules/portfolio/sections/skill_sections/skills_and_experience.dart';

import 'package:portfolio/modules/portfolio/controller/portfolio_controller.dart';

import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../widgets/new/fixedrightcircularmenu.dart';
import '../widgets/new/lifesidebarmenu.dart';
import 'contact/contact.dart';
import 'footer/footer.dart';

class PortfolioScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeModeNotifier;
  const PortfolioScreen({Key? key, required this.themeModeNotifier}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PortfolioController(),
      child: Consumer<PortfolioController>(
        builder: (context, controller, _) {
          final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
          final isDesktop = ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);

          controller.scrollController.addListener(() {
            controller.updateCurrentSection(context);
          });

          return Scaffold(
            body: Stack(
              children: [
                // Main Scrollable Content
                Positioned.fill(
                  left: controller.showLeftSidebar && isDesktop ? 200 : 0,
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      children: List.generate(6, (index) {
                        Widget section;
                        switch (index) {
                          case 0:
                            section = HomeSection(
                              key: controller.sectionKeys[0],
                              onMoreAboutMePressed: () => controller.scrollToSection(1),
                              onContactPressed: () => controller.scrollToSection(4),
                              themeMode: widget.themeModeNotifier.value,
                            );
                            break;
                          case 1:
                            section = AboutSection(
                              key: controller.sectionKeys[1],
                              themeMode: widget.themeModeNotifier.value,
                            );
                            break;
                          case 2:
                            section = SkillsAndExperienceSection(
                              key: controller.sectionKeys[2],
                              themeMode: widget.themeModeNotifier.value,
                            );
                            break;
                          case 3:
                            section = ProjectSection(
                              key: controller.sectionKeys[3],
                              themeMode: widget.themeModeNotifier.value,
                            );
                            break;
                          case 4:
                            section = ContactSection(
                              key: controller.sectionKeys[4],
                              themeMode: widget.themeModeNotifier.value,
                            );
                            break;
                          case 5:
                            section = FooterSection(
                              themeMode: widget.themeModeNotifier.value,
                            );
                            break;
                          default:
                            section = const SizedBox.shrink();
                        }

                        // Wrap each section with AutoScrollTag
                        return AutoScrollTag(
                          key: ValueKey(index),
                          controller: controller.scrollController,
                          index: index,
                          highlightColor: Colors.transparent,
                          child: section,
                        );
                      }),
                    ),
                  ),
                ),

                // Left Sidebar (Desktop Only)
                if (isDesktop)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: controller.showLeftSidebar ? 0 : -200,
                    top: 0,
                    bottom: 0,
                    width: 200,
                    child: LeftSidebarMenu(
                      selectedIndex: controller.currentSectionIndex,
                      onItemSelected: controller.scrollToSection,
                      sectionTitles: controller.sectionTitles,
                      themeMode: widget.themeModeNotifier.value,
                      onToggleTheme: () {
                        widget.themeModeNotifier.value =
                        isDarkTheme ? ThemeMode.light : ThemeMode.dark;
                      },
                    ),
                  ),

                // Fixed Right Circular Menu
                Align(
                  alignment: Alignment.centerRight,
                  child: FixedRightCircularMenu(
                    selectedIndex: controller.currentSectionIndex,
                    onItemSelected: controller.scrollToSection,
                    themeMode: widget.themeModeNotifier.value,
                    onToggleTheme: () {
                      widget.themeModeNotifier.value =
                      isDarkTheme ? ThemeMode.light : ThemeMode.dark;
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
