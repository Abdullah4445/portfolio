import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LeftSidebarMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final List<String> sectionTitles;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const LeftSidebarMenu({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.sectionTitles,
    required this.themeMode,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeMode == ThemeMode.dark;
    final Color sidebarBgColor = isDark ? Colors.grey[850]! : Colors.grey[200]!;
    final Color textColor = isDark ? Colors.white : Colors.black;
    final Color selectedItemBgColor = Colors.orange;

    // Sidebar width responsive
    final double sidebarWidth = ResponsiveValue(
      context,
      defaultValue: 220.0,
      conditionalValues: [
        Condition.smallerThan(name: DESKTOP, value: 180.0),
      ],
    ).value;

    // Profile image size responsive
    final double imageSize = ResponsiveValue(
      context,
      defaultValue: 100.0,
      conditionalValues: [
        Condition.smallerThan(name: DESKTOP, value: 80.0),
      ],
    ).value;

    return Container(
      width: sidebarWidth,
      color: sidebarBgColor,
      child: Column(
        children: [
          // Profile Image
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
            child: Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: (isDark ? Colors.white : Colors.black).withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network("assets/images/abdullah.png",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, size: 60, color: Colors.grey),
                ),
              ),
            ),
          ),

          // Menu Items
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(sectionTitles.length, (index) {
                  return _buildMenuItem(
                    context,
                    title: sectionTitles[index],
                    index: index,
                    isSelected: selectedIndex == index,
                    onTap: () => onItemSelected(index),
                    textColor: textColor,
                    selectedItemBgColor: selectedItemBgColor,
                  );
                }),
              ),
            ),
          ),

          // Theme Toggle Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: IconButton(
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: textColor,
                size: 28,
              ),
              onPressed: onToggleTheme,
              tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, {
        required String title,
        required int index,
        required bool isSelected,
        required VoidCallback onTap,
        required Color textColor,
        required Color selectedItemBgColor,
      }) {
    final double fontSize = ResponsiveValue(context,
      defaultValue: 14.0,
      conditionalValues: [
        Condition.smallerThan(name: TABLET, value: 12.0),
      ],
    ).value;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? selectedItemBgColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Icon(
              _getIconForSection(title),
              color: isSelected ? Colors.white : textColor,
              size: 18,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForSection(String title) {
    switch (title) {
      case 'Home':
        return Icons.home;
      case 'About Me':
        return Icons.person;
      case 'Skills & Experience':
        return Icons.code;
      case 'Projects':
        return Icons.folder_open;
      case 'Contact':
        return Icons.mail;
      default:
        return Icons.circle;
    }
  }
}
