// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class HomeSection extends StatelessWidget {
//   final GlobalKey? contactKey;
//
//   const HomeSection({Key? key, this.contactKey, required Future<void> Function() onMoreAboutMePressed, required Future<void> Function() onContactPressed, required ThemeMode themeMode}) : super(key: key);
//
//   Widget _buildCircleIcon(IconData icon, VoidCallback onTap) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: InkWell(
//         onTap: onTap,
//         child: CircleAvatar(
//           radius: 22,
//           backgroundColor: Colors.black,
//           child: Icon(icon, color: Colors.white, size: 20),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = MediaQuery.of(context).size.width < 900;
//
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//       child: isMobile
//           ? Column(
//         children: [
//           _buildLeftContent(context),
//           const SizedBox(height: 40),
//           _buildRightContent(),
//         ],
//       )
//           : Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(flex: 1, child: _buildLeftContent(context)),
//           const SizedBox(width: 40),
//           Expanded(flex: 1, child: _buildRightContent()),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLeftContent(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "HI THERE!",
//           style: GoogleFonts.poppins(
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//             color: Colors.amber[700],
//           ),
//         ),
//         const SizedBox(height: 12),
//         Row(
//           children: [
//             Text(
//               "I'M ",
//               style: GoogleFonts.poppins(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w800,
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               "ABDULLAH",
//               style: GoogleFonts.poppins(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w800,
//                 color: Colors.amber[700],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//           color: Colors.amber[700],
//           child: Text(
//             "FLUTTER DEVELOPER / PROGRAMMER",
//             style: GoogleFonts.poppins(
//               color: Colors.black,
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//           color: Colors.black,
//           child: Text(
//             "READY TO BUILD YOUR NEXT MOBILE & WEB PROJECT",
//             style: GoogleFonts.poppins(
//               color: Colors.white,
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           "I am Abdullah, a passionate Flutter developer and programmer. "
//               "I create professional mobile and web applications with modern UI/UX "
//               "and real-time features. My goal is to bring your ideas to life with "
//               "clean code and responsive design.",
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//             color: Colors.black87,
//             height: 1.6,
//           ),
//         ),
//         const SizedBox(height: 30),
//         ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.black,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
//           ),
//           child: Text(
//             "MORE ABOUT ME",
//             style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildRightContent() {
//     const double imageRadius = 140;
//     const double curveCanvasSize = imageRadius * 2 + 100;
//
//     return SizedBox(
//       width: curveCanvasSize + 50,
//       height: curveCanvasSize + 50,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Positioned(
//             child: SizedBox(
//               width: curveCanvasSize,
//               height: curveCanvasSize,
//               child: CustomPaint(
//                 painter: CurveWrapperPainter(imageRadius: imageRadius),
//               ),
//             ),
//           ),
//
//           // Profile Image
//           CircleAvatar(
//             radius: imageRadius,
//             backgroundImage: const AssetImage("assets/images/abdullah.png"),
//             onBackgroundImageError: (exception, stackTrace) {
//               print("Error loading image: $exception");
//             },
//             backgroundColor: Colors.grey[200],
//           ),
//
//           // Social / Feature Icons
//           Positioned(
//             right: (curveCanvasSize / 2) - imageRadius - 60,
//             top: (curveCanvasSize / 2) - imageRadius - 100,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Transform.translate(offset: const Offset(80, 0), child: _buildCircleIcon(Icons.home, () {})),
//                 Transform.translate(offset: const Offset(95, 55), child: _buildCircleIcon(Icons.person, () {})),
//                 Transform.translate(offset: const Offset(105, 110), child: _buildCircleIcon(Icons.work, () {})),
//                 Transform.translate(offset: const Offset(105, 165), child: _buildCircleIcon(Icons.computer, () {})),
//                 Transform.translate(offset: const Offset(95, 220), child: _buildCircleIcon(Icons.email, () {})),
//                 Transform.translate(offset: const Offset(80, 275), child: _buildCircleIcon(Icons.send, () {})),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CurveWrapperPainter extends CustomPainter {
//   final double imageRadius;
//
//   CurveWrapperPainter({required this.imageRadius});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.amber[700]!
//       ..strokeWidth = 5
//       ..style = PaintingStyle.stroke;
//
//     final Path path = Path();
//
//     final Offset center = Offset(size.width / 2, size.height / 2);
//
//     final double curveRadius = imageRadius + 30;
//
//     final double startAngle = -0.6;
//     final double endAngle = 1.6;
//
//     final Offset startPoint = Offset(
//       center.dx + curveRadius * cos(startAngle),
//       center.dy + curveRadius * sin(startAngle),
//     );
//
//     final Offset endPoint = Offset(
//       center.dx + curveRadius * cos(endAngle),
//       center.dy + curveRadius * sin(endAngle),
//     );
//
//     path.moveTo(startPoint.dx, startPoint.dy);
//
//     final Rect rect = Rect.fromCircle(center: center, radius: curveRadius);
//     path.arcTo(rect, startAngle, endAngle - startAngle, false);
//
//     canvas.drawPath(path, paint);
//
//     final Paint dotPaint = Paint()
//       ..color = Colors.amber[700]!
//       ..style = PaintingStyle.fill;
//
//     canvas.drawCircle(startPoint, 5, dotPaint);
//     canvas.drawCircle(endPoint, 5, dotPaint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
