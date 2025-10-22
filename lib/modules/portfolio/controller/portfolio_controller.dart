import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PortfolioController extends ChangeNotifier {
  final AutoScrollController scrollController = AutoScrollController();
  int currentSectionIndex = 0;
  bool showLeftSidebar = false;

  final List<GlobalKey> sectionKeys = [
    GlobalKey(), // Home
    GlobalKey(), // About
    GlobalKey(), // Skills
    GlobalKey(), // Projects
    GlobalKey(), // Contact
  ];

  List<String> sectionTitles = [
    'Home',
    'About Me',
    'Skills & Experience',
    'Projects',
    'Contact',
  ];

  void updateCurrentSection(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double homeHeight = sectionKeys[0].currentContext?.size?.height ?? screenHeight;

    // Sidebar visibility
    showLeftSidebar = scrollController.offset > homeHeight - 100;

    // Section detection
    for (int i = 0; i < sectionKeys.length; i++) {
      final keyContext = sectionKeys[i].currentContext;
      if (keyContext != null) {
        final renderBox = keyContext.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        if (position.dy < screenHeight * 0.5 &&
            position.dy + renderBox.size.height > screenHeight * 0.5) {
          if (currentSectionIndex != i) {
            currentSectionIndex = i;
            notifyListeners();
          }
          break;
        }
      }
    }
  }

  Future<void> scrollToSection(int index) async {
    await scrollController.scrollToIndex(
      index,
      duration: const Duration(milliseconds: 600),
      preferPosition: AutoScrollPosition.begin,
    );
    currentSectionIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
