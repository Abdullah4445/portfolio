import 'package:flutter/material.dart';

class PortfolioController extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  int currentSectionIndex = 0;
  bool showLeftSidebar = true;

  // Section Titles
  final List<String> sectionTitles = [
    'Home',
    'About Me',
    'Skills & Experience',
    'Projects',
    'Contact',
  ];

  // Section Keys
  final List<GlobalKey> sectionKeys = List.generate(5, (_) => GlobalKey());

  void scrollToSection(int index) {
    final keyContext = sectionKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      currentSectionIndex = index;
      notifyListeners();
    }
  }

  void updateCurrentSection(BuildContext context) {
    for (int i = 0; i < sectionKeys.length; i++) {
      final keyContext = sectionKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        // Approximate viewport detection
        if (position >= 0 && position < MediaQuery.of(context).size.height / 2) {
          currentSectionIndex = i;
          notifyListeners();
          break;
        }
      }
    }
  }
}
