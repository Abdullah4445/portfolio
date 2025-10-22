// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_framework/responsive_framework.dart';
//
// class ContactSection extends StatelessWidget {
//   final ThemeMode themeMode;
//
//   const ContactSection({Key? key, required this.themeMode}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final isDark = themeMode == ThemeMode.dark;
//     final bool isDesktop =
//     ResponsiveBreakpoints.of(context).largerOrEqualTo(DESKTOP);
//
//     final Color textColor = isDark ? Colors.white70 : Colors.black87;
//     final Color secondaryTextColor = isDark ? Colors.white60 : Colors.black54;
//     final Color backgroundColor = isDark ? Colors.grey[900]! : Colors.grey[100]!;
//
//     return Container(
//       color: backgroundColor,
//       padding: EdgeInsets.symmetric(
//         horizontal: 24,
//         vertical: isDesktop ? 80 : 50,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Contact Me",
//             style: GoogleFonts.poppins(
//               fontSize: isDesktop ? 40 : 28,
//               fontWeight: FontWeight.bold,
//               color: textColor,
//             ),
//           ),
//           const SizedBox(height: 30),
//
//           // Contact Form & Info
//           if (isDesktop)
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(child: _buildContactForm(textColor)),
//                 const SizedBox(width: 40),
//                 Expanded(child: _buildContactInfo(textColor)),
//               ],
//             )
//           else
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildContactForm(textColor),
//                 const SizedBox(height: 40),
//                 _buildContactInfo(textColor),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildContactForm(Color textColor) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Send me a message",
//           style: GoogleFonts.poppins(
//             fontSize: 22,
//             fontWeight: FontWeight.w600,
//             color: textColor,
//           ),
//         ),
//         const SizedBox(height: 20),
//         TextFormField(
//           decoration: InputDecoration(
//             labelText: "Your Name",
//             labelStyle: TextStyle(color: textColor),
//             border: const OutlineInputBorder(),
//             contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           ),
//         ),
//         const SizedBox(height: 16),
//         TextFormField(
//           decoration: InputDecoration(
//             labelText: "Your Email",
//             labelStyle: TextStyle(color: textColor),
//             border: const OutlineInputBorder(),
//             contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           ),
//           keyboardType: TextInputType.emailAddress,
//         ),
//         const SizedBox(height: 16),
//         TextFormField(
//           decoration: InputDecoration(
//             labelText: "Subject",
//             labelStyle: TextStyle(color: textColor),
//             border: const OutlineInputBorder(),
//             contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           ),
//         ),
//         const SizedBox(height: 16),
//         TextFormField(
//           decoration: InputDecoration(
//             labelText: "Message",
//             labelStyle: TextStyle(color: textColor),
//             border: const OutlineInputBorder(),
//             contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           ),
//           maxLines: 4,
//         ),
//         const SizedBox(height: 24),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: ElevatedButton(
//             onPressed: () {
//               // TODO: Add send message logic
//             },
//             style: ElevatedButton.styleFrom(
//               padding:
//               const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//             ),
//             child: const Text("Send Message"),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildContactInfo(Color textColor) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Contact Information",
//           style: GoogleFonts.poppins(
//             fontSize: 22,
//             fontWeight: FontWeight.w600,
//             color: textColor,
//           ),
//         ),
//         const SizedBox(height: 20),
//         ListTile(
//           leading: Icon(Icons.location_on, color: textColor),
//           title: Text(
//             "Lahore, Pakistan",
//             style: GoogleFonts.poppins(color: textColor, fontSize: 16),
//           ),
//         ),
//         ListTile(
//           leading: Icon(Icons.phone, color: textColor),
//           title: Text(
//             "+92 300 1234567",
//             style: GoogleFonts.poppins(color: textColor, fontSize: 16),
//           ),
//         ),
//         ListTile(
//           leading: Icon(Icons.email, color: textColor),
//           title: Text(
//             "abdullah.programmer@example.com",
//             style: GoogleFonts.poppins(color: textColor, fontSize: 16),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           "Follow Me",
//           style: GoogleFonts.poppins(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: textColor,
//           ),
//         ),
//         const SizedBox(height: 10),
//         Wrap(
//           spacing: 12,
//           children: [
//             IconButton(
//               icon: FaIcon(FontAwesomeIcons.linkedin, color: textColor),
//               onPressed: () {
//                 // Open LinkedIn
//               },
//             ),
//             IconButton(
//               icon: FaIcon(FontAwesomeIcons.github, color: textColor),
//               onPressed: () {
//                 // Open GitHub
//               },
//             ),
//             IconButton(
//               icon: FaIcon(FontAwesomeIcons.twitter, color: textColor),
//               onPressed: () {
//                 // Open Twitter
//               },
//             ),
//             IconButton(
//               icon: FaIcon(FontAwesomeIcons.facebook, color: textColor),
//               onPressed: () {
//                 // Open Facebook
//               },
//             ),
//             IconButton(
//               icon: FaIcon(FontAwesomeIcons.instagram, color: textColor),
//               onPressed: () {
//                 // Open Instagram
//               },
//             ),
//             IconButton(
//               icon: FaIcon(FontAwesomeIcons.youtube, color: textColor),
//               onPressed: () {
//                 // Open YouTube
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
