import 'package:url_launcher/url_launcher.dart';

class EmailLauncher {
  static Future<bool> sendEmail({
    required String fromEmail,
    required String subject,
    required String message,
  }) async {
    final Uri mail = Uri.parse(
        "mailto:yourgmail@gmail.com?subject=${Uri.encodeComponent(subject)}&body=From:%20$fromEmail%0A%0A${Uri.encodeComponent(message)}");

    return await launchUrl(mail);
  }
}
