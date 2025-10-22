// // lib/modules/widgets/views/footersections.dart
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class FooterSection extends StatelessWidget {
//   final ThemeMode themeMode;
//   const FooterSection({Key? key, required this.themeMode}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isDark = themeMode == ThemeMode.dark;
//     final Color footerBackgroundColor = isDark ? Colors.blueGrey[900]! : Colors.blueGrey[200]!;
//     final Color textColor = isDark ? Colors.white70 : Colors.black54;
//
//     return Container(
//       padding: const EdgeInsets.all(20),
//       color: footerBackgroundColor,
//       child: Center(
//         child: Text(
//           '© ${DateTime.now().year} Abdullah Programmer. All rights reserved.',
//           style: GoogleFonts.poppins(fontSize: 14, color: textColor),
//         ),
//       ),
//     );
//   }
// }