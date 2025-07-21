import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // 🧠 Animated Text 1
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "●  Hello! I'm a dedicated Junior Flutter Developer with a strong passion for creating responsive and user-friendly mobile and web applications.",
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 16),
                  speed: const Duration(milliseconds: 30),
                ),
              ],
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 16),

            // 🧠 Animated Text 2
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "●  I have experience working on a range of personal and collaborative projects that involve state management, RESTful APIs, authentication, and scalable UI design.",
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 16),
                  speed: const Duration(milliseconds: 30),
                ),
              ],
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 16),

            // 🧠 Animated Text 3
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "●    I hold a background in software development and continue to expand my skill set through real-world practice, open-source contributions, and freelance work. My goal is to grow as a full-stack mobile developer and contribute to innovative tech solutions.",
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 16),
                  speed: const Duration(milliseconds: 30),
                ),
              ],
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 32),

            // 🧾 Resume Button
            ElevatedButton.icon(
              onPressed: () {
                _launchURL(context, 'https://example.com/your_resume.pdf');
              },
              icon: const Icon(Icons.download),
              label: const Text('Download Resume'),
            ),
          ],
        ),
      ),
    );
  }
}