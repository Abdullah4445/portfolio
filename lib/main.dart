import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart'; // Ensure this is the correct import for v1.x
import 'package:url_launcher/url_launcher.dart';

import 'modules/widgets/views/contactsections.dart';
import 'modules/widgets/views/footersections.dart';
import 'modules/widgets/views/portfolio.dart';
import 'modules/widgets/views/projectcard.dart';

// --- Utility function for launching URLs ---
Future<void> launchURL(BuildContext context, String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Could not launch $url')),
    );
  }
}
// ------------------------------------------

void main() {
  runApp(const MyApp());
}

// MyApp is now a StatefulWidget to manage theme mode changes
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ValueNotifier to manage the current ThemeMode and notify listeners
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, currentThemeMode, child) {
        return MaterialApp(
          title: 'My Portfolio',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              color: Colors.blue,
              foregroundColor: Colors.white,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black87),
              bodyMedium: TextStyle(color: Colors.black87),
              titleLarge: TextStyle(color: Colors.black),
              titleMedium: TextStyle(color: Colors.black),
              bodySmall: TextStyle(color: Colors.black54),
            ),
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              color: Colors.blueGrey,
              foregroundColor: Colors.white,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              titleLarge: TextStyle(color: Colors.white),
              titleMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white),
            ),
          ),
          themeMode: currentThemeMode,
          // *** THIS IS THE CRITICAL CHANGE FOR ResponsiveFramework v1.x ***
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!, // `child` is now a named parameter and nullable
            breakpoints: const [
              Breakpoint(start: 0, end: 480, name: MOBILE),
              Breakpoint(start: 481, end: 800, name: TABLET),
              Breakpoint(start: 801, end: 1000, name: DESKTOP),
              // You can add more breakpoints like this:
              // Breakpoint(start: 1001, end: double.infinity, name: 'XL'),
            ],
            // max/min width and default scale are now defined within Breakpoint or
            // controlled by ResponsiveScaledBox/ResponsiveVisibility if needed.
          ),
          home: PortfolioScreen(themeModeNotifier: _themeMode),
        );
      },
    );
  }
}
























