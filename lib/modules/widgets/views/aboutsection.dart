// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';
// // Removed 'dart:math' as it's not used in this specific AboutSection code.
//
// // Define TrianglePainter as a top-level class
// class TrianglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()..color = Colors.white;
//     final Path path = Path();
//     path.moveTo(0, size.height / 2);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.close();
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
//
// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key, required ThemeMode themeMode});
//
//   void _launchURL(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       print('Could not launch $url');
//     }
//   }
//
//   /// Sidebar Item Widget
//   Widget _buildSidebarItem(
//       IconData icon, String title, VoidCallback onTap,
//       {bool isSelected = false}) {
//     return InkWell(
//       onTap: onTap,
//       child: Stack(
//         alignment: Alignment.centerRight,
//         children: [
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 12.0),
//             color: isSelected
//                 ? Colors.white.withOpacity(0.9)
//                 : Colors.transparent,
//             child: Column(
//               children: [
//                 Icon(icon, color: Colors.black, size: 28),
//                 const SizedBox(height: 6),
//                 Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (isSelected)
//             Positioned(
//               right: -1,
//               child: CustomPaint(
//                 painter: TrianglePainter(), // Now correctly references the top-level class
//                 size: const Size(20, 20),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   /// Sidebar Widget
//   Widget _buildSidebar(BuildContext context) {
//     return Container(
//       width: 200,
//       color: Colors.amber[700], // Matches image_103c88.jpg
//       child: Column(
//         children: [
//           const SizedBox(height: 40),
//           // Profile Image
//           Container(
//             width: 120,
//             height: 120,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white, width: 3),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   spreadRadius: 2,
//                   blurRadius: 10,
//                   offset: const Offset(0, 5),
//                 ),
//               ],
//               image: const DecorationImage(
//                 image: AssetImage("assets/images/sarita.png"), // Assuming this is your correct image path
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(height: 40),
//           _buildSidebarItem(Icons.home, "HOME", () {}),
//           _buildSidebarItem(Icons.person, "ABOUT ME", () {}, isSelected: true), // Selected as in image
//           _buildSidebarItem(Icons.article, "RESUME", () {}),
//           _buildSidebarItem(Icons.work, "PORTFOLIO", () {}),
//           _buildSidebarItem(Icons.reviews, "TESTIMONIALS", () {}),
//           _buildSidebarItem(Icons.contact_mail, "CONTACT", () {}),
//           const SizedBox(height: 40),
//         ],
//       ),
//     );
//   }
//
//   /// Tab Buttons
//   Widget _buildTabButton(String text, {bool isSelected = false}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.amber[700] : Colors.grey[300], // Selected tab is amber, unselected is grey
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Text(
//         text,
//         style: GoogleFonts.poppins(
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//           color: isSelected ? Colors.black : Colors.black87, // Text color changes with selection
//         ),
//       ),
//     );
//   }
//
//   /// Service Item
//   Widget _buildService(IconData icon, String title, String desc) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             radius: 28,
//             backgroundColor: Colors.amber[100], // Light amber background for icons
//             child: Icon(icon, color: Colors.amber[700], size: 28), // Darker amber icon color
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   desc,
//                   style: GoogleFonts.poppins(
//                       fontSize: 12, color: Colors.black54),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Fun Fact Item
//   Widget _buildFunFact(String value, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         CircleAvatar(
//           radius: 40,
//           backgroundColor: Colors.black, // Black background for fun fact circles
//           child: Text(
//             value,
//             style: GoogleFonts.poppins(
//               color: Colors.amber, // Amber text for value
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           label,
//           textAlign: TextAlign.center,
//           style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87), // Black text for label
//         ),
//       ],
//     );
//   }
//
//   /// Main Content
//   Widget _buildContent() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title with line and arrow
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(width: 50, height: 2, color: Colors.black), // Line as in image
//               const SizedBox(width: 10),
//               Icon(Icons.arrow_right_alt, color: Colors.black, size: 30), // Arrow icon as in image
//               const SizedBox(width: 10),
//               Text(
//                 "ABOUT ME",
//                 style: GoogleFonts.poppins(
//                   fontSize: 40, // Large font size for title
//                   fontWeight: FontWeight.w800,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Text.rich(
//             TextSpan(
//               text: "I'm ",
//               style: GoogleFonts.poppins(fontSize: 18, color: Colors.black87),
//               children: [
//                 TextSpan(
//                   text: "Sarita Smith, ", // Name as in image
//                   style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.amber[700], // Amber color for name
//                   ),
//                 ),
//                 const TextSpan(text: "Graphic Designer / Photographer"), // Title as in image
//               ],
//             ),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             "Veriatio erioris eserum fuga. Pa cusaper rovitin nonsequos aceate\n"
//                 "cus veribearum intur? Quis et eos arumquae periae nonet apeli-\n"
//                 "tiore comnim volore reptus undebitas si cus estem hariaeped\n"
//                 "quosaere vitemqu isquam facest quia volupta cum sus.", // Lorem ipsum from image
//             style: GoogleFonts.poppins(
//                 fontSize: 14, height: 1.6, color: Colors.black54),
//           ),
//           const SizedBox(height: 40),
//           // Tabs
//           Row(
//             children: [
//               _buildTabButton("What I Do?", isSelected: true), // "What I Do?" tab selected
//               const SizedBox(width: 15),
//               _buildTabButton("Fun Facts"), // "Fun Facts" tab unselected
//             ],
//           ),
//           const SizedBox(height: 30),
//           // Services
//           Column(
//             children: [
//               _buildService(Icons.brush, "PRINT DESIGN", // Placeholder icons match the visual style
//                   "Veriatio erioris eserum fuga. Pa cusaper rovitin nonsequos aceate."),
//               const SizedBox(height: 20),
//               _buildService(Icons.web, "WEB DESIGN",
//                   "Veriatio erioris eserum fuga. Pa cusaper rovitin nonsequos aceate."),
//               const SizedBox(height: 20),
//               _buildService(Icons.camera_alt, "PHOTOGRAPHY",
//                   "Veriatio erioris eserum fuga. Pa cusaper rovitin nonsequos aceate."),
//             ],
//           ),
//           const SizedBox(height: 50),
//           // Fun Facts
//           Wrap(
//             spacing: 30,
//             runSpacing: 30,
//             children: [
//               _buildFunFact("10+", "YEARS EXPERIENCE"), // Data from image
//               _buildFunFact("450", "PROJECTS DONE"), // Data from image
//               _buildFunFact("65", "WON AWARDS"), // Data from image
//               _buildFunFact("300+", "HAPPY CLIENTS"), // Data from image
//               _buildFunFact("650K+", "SATISFIED FOLLOWERS"), // Data from image
//               _buildFunFact("+10", "NEW VIDEOS EACH MONTH"), // Data from image
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = MediaQuery.of(context).size.width < 900;
//
//     return Container(
//       color: Colors.grey[200], // Main background color as in image
//       child: isMobile
//           ? Column(
//         children: [
//           _buildSidebar(context),
//           const SizedBox(height: 20),
//           _buildContent(),
//         ],
//       )
//           : Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSidebar(context),
//           Expanded(child: _buildContent()),
//         ],
//       ),
//     );
//   }
// }