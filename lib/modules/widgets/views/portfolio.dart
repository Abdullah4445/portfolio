import 'package:flutter/material.dart';
import 'package:portfolio/modules/widgets/views/project_section.dart';
import 'package:portfolio/modules/widgets/views/skillsections.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../main.dart';
import 'aboutsection.dart';
import 'contactsections.dart';
import 'footersections.dart';
import 'homesections.dart';

class PortfolioScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeModeNotifier;

  const PortfolioScreen({Key? key, required this.themeModeNotifier}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildNavButton(String text, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSection(key),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).appBarTheme.foregroundColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // *** THIS IS THE CRITICAL CHANGE FOR CHECKING BREAKPOINTS IN v1.x ***
    // Use ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP)
    // to check if the current breakpoint is DESKTOP or a larger one.
    final isDesktop = ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              widget.themeModeNotifier.value == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              widget.themeModeNotifier.value =
              widget.themeModeNotifier.value == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
            tooltip: 'Toggle Theme',
          ),
          if (isDesktop) ...[
            _buildNavButton('Home', _homeKey),
            _buildNavButton('About', _aboutKey),
            _buildNavButton('Skills', _skillsKey),
            _buildNavButton('Projects', _projectsKey),
            _buildNavButton('Contact', _contactKey),
          ],
        ],
      ),
      drawer: isDesktop
          ? null
          : Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('Navigation', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                _scrollToSection(_homeKey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                _scrollToSection(_aboutKey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Skills'),
              onTap: () {
                _scrollToSection(_skillsKey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Projects'),
              onTap: () {
                _scrollToSection(_projectsKey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                _scrollToSection(_contactKey);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HomeSection(key: _homeKey, contactKey: _contactKey),
            AboutSection(key: _aboutKey),
            SkillsSection(key: _skillsKey),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactKey),
            const Footer(),
          ],
        ),
      ),
    );
  }
}