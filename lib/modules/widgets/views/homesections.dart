import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  final GlobalKey? contactKey;

  const HomeSection({Key? key, this.contactKey}) : super(key: key);

  void launchURL(BuildContext context, String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextStyle(
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TyperAnimatedText('Hello, I\'m Abdullah 💻'),
                TyperAnimatedText('A Flutter Developer 💙'),
                TyperAnimatedText('Let\'s build something awesome! 🚀'),
              ],
              isRepeatingAnimation: true,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Delivering Modern, User-Centric Flutter Solutions',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),


          const SizedBox(height: 32),
          const CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage('https://via.placeholder.com/200'), // replace with your image URL
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  launchURL(context, 'https://example.com/your_cv.pdf');
                },
                icon: const Icon(Icons.download),
                label: const Text('Download CV'),
              ),
              OutlinedButton(
                onPressed: () {
                  if (contactKey != null && contactKey!.currentContext != null) {
                    Scrollable.ensureVisible(
                      contactKey!.currentContext!,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Contact section not found.')),
                    );
                  }
                },
                child: const Text('Hire Me'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
