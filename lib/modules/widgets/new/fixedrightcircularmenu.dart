// FixedRightCircularMenu (Responsive)
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FixedRightCircularMenu extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const FixedRightCircularMenu({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.themeMode,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDark = themeMode == ThemeMode.dark;
    final Color circleBgColor = isDark ? Colors.blueGrey[800]! : Colors.black;
    final Color selectedCircleColor = Colors.orange; // Always orange

    // Responsive width for the menu
    final double menuWidth = ResponsiveValue(
      context,
      defaultValue: 80.0,
      conditionalValues: [
        Condition.smallerThan(name: DESKTOP, value: 60.0), // Smaller on Tablet
      ],
    ).value!;

    // Responsive height for the menu
    final double menuHeight = ResponsiveValue(
      context,
      defaultValue: MediaQuery.of(context).size.height * 0.6,
      conditionalValues: [
        Condition.smallerThan(name: DESKTOP, value: MediaQuery.of(context).size.height * 0.7), // Taller on Tablet
      ],
    ).value!;

    // Responsive icon size
    final double iconSize = ResponsiveValue(
      context,
      defaultValue: 24.0,
      conditionalValues: [
        Condition.smallerThan(name: DESKTOP, value: 20.0), // Smaller on Tablet
      ],
    ).value!;

    // Responsive circle size
    final double circleSize = ResponsiveValue(
      context,
      defaultValue: 50.0,
      conditionalValues: [
        Condition.smallerThan(name: DESKTOP, value: 40.0), // Smaller on Tablet
      ],
    ).value!;


    return Container(
      alignment: Alignment.centerRight,
      width: menuWidth,
      height: menuHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMenuItem(Icons.home, 0, circleBgColor, selectedCircleColor, circleSize, iconSize),
          _buildMenuItem(Icons.person, 1, circleBgColor, selectedCircleColor, circleSize, iconSize),
          _buildMenuItem(Icons.code, 2, circleBgColor, selectedCircleColor, circleSize, iconSize),
          _buildMenuItem(Icons.folder_open, 3, circleBgColor, selectedCircleColor, circleSize, iconSize),
          _buildMenuItem(Icons.mail, 4, circleBgColor, selectedCircleColor, circleSize, iconSize),
          // Theme Toggle at the bottom of the right menu
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: isDark ? Colors.white : Colors.grey[400],
              size: iconSize,
            ),
            onPressed: onToggleTheme,
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, int index, Color bgColor, Color selectedColor, double circleSize, double iconSize) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == index ? selectedColor : bgColor,
          border: Border.all(color: Colors.white, width: 2), // White border
          boxShadow: [
            BoxShadow(
              color: (selectedIndex == index ? selectedColor : Colors.black).withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: selectedIndex == index ? Colors.white : Colors.grey[400],
          size: iconSize,
        ),
      ),
    );
  }
}