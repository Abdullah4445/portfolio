import 'package:flutter/material.dart';

import '../../../main.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contact', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            maxLines: 4,
            keyboardType: TextInputType.multiline,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              const email = 'abdullahghaffar4445gmail.com';
              const subject = 'Portfolio Contact Form Inquiry';
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: email,
                query: encodeQueryParameters(<String, String>{
                  'subject': subject,
                  'body': 'Hi, I would like to get in touch regarding your portfolio. [Your message here]'
                }),
              );
              launchURL(context, emailLaunchUri.toString());
            },
            child: const Text('Send Message'),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            alignment: WrapAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.email),
                tooltip: 'Send Email',
                onPressed: () {
                  launchURL(context, 'mailto:your.email@example.com');
                },
              ),
              IconButton(
                icon: const Icon(Icons.kayaking),
                tooltip: 'LinkedIn Profile',
                onPressed: () {
                  launchURL(context, 'https://linkedin.com/in/yourprofile');
                },
              ),
              IconButton(
                icon: const Icon(Icons.link),
                tooltip: 'GitHub Profile',
                onPressed: () {
                  launchURL(context, 'https://github.com/yourusername');
                },
              ),
              IconButton(
                icon: const Icon(Icons.label),
                tooltip: 'WhatsApp',
                onPressed: () {
                  launchURL(context, 'https://wa.me/yourphonenumber');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
