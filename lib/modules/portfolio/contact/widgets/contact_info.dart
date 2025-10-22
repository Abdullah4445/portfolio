import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/modules/widgets/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  final Color textColor;

  const ContactInfo({Key? key, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        const SizedBox(height: 20),
        ListTile(
          leading: Icon(Icons.location_on, color: textColor),
          title: Text(
            "Vehari, Pakistan",
            style: GoogleFonts.poppins(color: textColor, fontSize: 16),
          ),
        ),
        ListTile(
          leading: Icon(Icons.phone, color: textColor),
          title: Text(
            "+92 327 1774145",
            style: GoogleFonts.poppins(color: textColor, fontSize: 16),
          ),
        ),
        ListTile(
          leading: Icon(Icons.email, color: textColor),
          title: Text(
            "abdullahghaffar4445@gmail.com",
            style: GoogleFonts.poppins(color: textColor, fontSize: 16),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Follow Me",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          children: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.linkedin, color: textColor),
              onPressed: () => openUrl('https://www.linkedin.com/in/abdullah-ghaffar-bb6b0b322/'),
            ),

            IconButton(
              icon: FaIcon(FontAwesomeIcons.github, color: textColor),
              onPressed: () => openUrl('https://github.com/Abdullah4445'),
            ),

            IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter, color: textColor),
              onPressed: () => openUrl('https://twitter.com/yourprofile'),
            ),



            IconButton(
              icon: FaIcon(FontAwesomeIcons.facebook, color: textColor),
                onPressed: () => openUrl('https://www.facebook.com/profile.php?id=61560814733513'),

            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.instagram, color: textColor),
              onPressed: () {
                // Open Instagram
              },
            ),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.youtube, color: textColor),
              onPressed: () {
                // Open YouTube
              },
            ),
          ],
        ),
      ],
    );
  }
}