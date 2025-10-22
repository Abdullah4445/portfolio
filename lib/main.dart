import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/app_theme.dart';
import 'core/apps_constants.dart';
import 'modules/portfolio/portfolio.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, currentThemeMode, child) {
        return MaterialApp(
          title: 'My Portfolio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentThemeMode,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: appBreakpoints,
          ),
          home: PortfolioScreen(themeModeNotifier: _themeMode),
        );
      },
    );
  }
}
