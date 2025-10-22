import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignationButtons extends StatelessWidget {
  final Color color;
  const DesignationButtons({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> designations = [
      "WEB DEVELOPER",
      "UI/UX DESIGNER",
      "SOFTWARE ENGINEER"
    ];

    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: designations.map((text) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
