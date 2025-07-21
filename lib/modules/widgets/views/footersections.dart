import 'package:flutter/material.dart';

import '../../../main.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Text(
            '© 2023 Your Name. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            alignment: WrapAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.face_2_outlined),
                tooltip: 'LinkedIn',
                onPressed: () {
                  launchURL(context, 'https://linkedin.com/in/yourprofile');
                },
              ),
              IconButton(
                icon: const Icon(Icons.link),
                tooltip: 'GitHub',
                onPressed: () {
                  launchURL(context, 'https://github.com/yourusername');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}