// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart'; // Ensure this import is present
// import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome icons
//
// class ContactSection extends StatefulWidget {
//   const ContactSection({super.key, required ThemeMode themeMode}); // Use super.key for consistency
//
//   @override
//   State<ContactSection> createState() => _ContactSectionState();
// }
//
// class _ContactSectionState extends State<ContactSection> with SingleTickerProviderStateMixin {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();
//   final _formKey = GlobalKey<FormState>(); // Key for form validation
//
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000), // Fade-in duration
//     );
//     _fadeAnimation = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   // Helper function to encode query parameters for URL
//   String? _encodeQueryParameters(Map<String, String> params) {
//     return params.entries
//         .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
//         .join('&');
//   }
//
//   // Function to launch URLs
//   void _launchURL(BuildContext context, String url) async {
//     final Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not open the link: $url')),
//       );
//     }
//   }
//
//   // Function to handle sending email
//   void _sendEmail(BuildContext context) {
//     if (_formKey.currentState!.validate()) {
//       final String name = _nameController.text;
//       final String email = _emailController.text;
//       final String message = _messageController.text;
//
//       const String recipientEmail = 'abdullahghaffar4445@gmail.com'; // Your actual email address
//       final String subject = 'Portfolio Contact from $name';
//       final String body = 'Name: $name\nEmail: $email\n\nMessage:\n$message';
//
//       final Uri emailLaunchUri = Uri(
//         scheme: 'mailto',
//         path: recipientEmail,
//         query: _encodeQueryParameters(<String, String>{
//           'subject': subject,
//           'body': body,
//         }),
//       );
//
//       _launchURL(context, emailLaunchUri.toString());
//
//       // Optionally, clear the form after sending
//       _nameController.clear();
//       _emailController.clear();
//       _messageController.clear();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Message sent successfully!')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Determine current theme brightness
//     final Brightness brightness = Theme.of(context).brightness;
//     final bool isDarkMode = brightness == Brightness.dark;
//
//     // Define colors based on theme brightness
//     final Color backgroundColor = isDarkMode ? Colors.grey[900]! : Colors.white;
//     final Color textColor = isDarkMode ? Colors.white : Colors.black87;
//     final Color hintColor = isDarkMode ? Colors.grey[500]! : Colors.grey[600]!;
//     final Color borderColor = isDarkMode ? Colors.grey[700]! : Colors.grey[400]!;
//     final Color fillColor = isDarkMode ? Colors.grey[800]! : Colors.grey[50]!;
//     final Color accentColor = isDarkMode ? Colors.blueAccent : Colors.deepPurple;
//     final Color shadowColor = isDarkMode ? Colors.black.withOpacity(0.4) : Colors.grey.withOpacity(0.2);
//
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: Container(
//         padding: const EdgeInsets.all(32),
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: shadowColor,
//               spreadRadius: 3,
//               blurRadius: 10,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Get In Touch', // More professional title
//               style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                 fontSize: 36,
//                 fontWeight: FontWeight.bold,
//                 color: textColor,
//               ),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               'Have a question or want to work together? Feel free to reach out!',
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                 fontSize: 18,
//                 color: hintColor,
//               ),
//             ),
//             const SizedBox(height: 32),
//
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: _nameController,
//                     decoration: InputDecoration(
//                       labelText: 'Your Name',
//                       hintText: 'Enter your full name',
//                       labelStyle: TextStyle(color: hintColor),
//                       hintStyle: TextStyle(color: hintColor.withOpacity(0.7)),
//                       filled: true,
//                       fillColor: fillColor,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: borderColor),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: borderColor),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: accentColor, width: 2),
//                       ),
//                     ),
//                     style: TextStyle(color: textColor),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Your Email',
//                       hintText: 'name@example.com',
//                       labelStyle: TextStyle(color: hintColor),
//                       hintStyle: TextStyle(color: hintColor.withOpacity(0.7)),
//                       filled: true,
//                       fillColor: fillColor,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: borderColor),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: borderColor),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: accentColor, width: 2),
//                       ),
//                     ),
//                     style: TextStyle(color: textColor),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return 'Please enter a valid email address';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       labelText: 'Your Message',
//                       hintText: 'Type your message here...',
//                       labelStyle: TextStyle(color: hintColor),
//                       hintStyle: TextStyle(color: hintColor.withOpacity(0.7)),
//                       filled: true,
//                       fillColor: fillColor,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: borderColor),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: borderColor),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide(color: accentColor, width: 2),
//                       ),
//                     ),
//                     style: TextStyle(color: textColor),
//                     maxLines: 6, // Increased maxLines for more message space
//                     keyboardType: TextInputType.multiline,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your message';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 24),
//                   ElevatedButton.icon(
//                     onPressed: () => _sendEmail(context),
//                     icon: const Icon(Icons.send, color: Colors.white),
//                     label: const Text('Send Message', style: TextStyle(color: Colors.white, fontSize: 18)),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: accentColor,
//                       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       elevation: 8,
//                       shadowColor: accentColor.withOpacity(0.5),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 40),
//             Center(
//               child: Wrap(
//                 spacing: 24, // Increased spacing between icons
//                 runSpacing: 24,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   // Email Icon
//                   _buildSocialIcon(
//                     icon: EvaIcons.email, // Using generic email icon
//                     tooltip: 'Send Email',
//                     url: 'mailto:abdullahghaffar4445@gmail.com', // Your email
//                     iconColor: isDarkMode ? Colors.white : Colors.redAccent, // Red for email
//                   ),
//                   // LinkedIn Icon (using FontAwesomeIcons)
//                   _buildSocialIcon(
//                     icon: FontAwesomeIcons.linkedin, // LinkedIn icon
//                     tooltip: 'LinkedIn Profile',
//                     url: 'https://linkedin.com/in/yourprofile', // Replace with your LinkedIn URL
//                     iconColor: isDarkMode ? Colors.white : const Color(0xFF0A66C2), // LinkedIn blue
//                   ),
//                   // GitHub Icon (using FontAwesomeIcons)
//                   _buildSocialIcon(
//                     icon: FontAwesomeIcons.github, // GitHub icon
//                     tooltip: 'GitHub Profile',
//                     url: 'https://github.com/yourusername', // Replace with your GitHub URL
//                     iconColor: isDarkMode ? Colors.white : Colors.black, // Black for GitHub
//                   ),
//                   // WhatsApp Icon (using FontAwesomeIcons)
//                   _buildSocialIcon(
//                     icon: FontAwesomeIcons.whatsapp, // WhatsApp icon
//                     tooltip: 'WhatsApp',
//                     url: 'https://wa.me/+923001234567', // Replace with your WhatsApp number (e.g., +923001234567)
//                     iconColor: isDarkMode ? Colors.white : const Color(0xFF25D366), // WhatsApp green
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper widget to build social media icons
//   Widget _buildSocialIcon ({
//     required IconData icon,
//     required String tooltip,
//     required String url,
//     required Color iconColor,
//   }) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: () => _launchURL(context, url),
//           borderRadius: BorderRadius.circular(30), // Rounded for effect
//           child: Padding(
//             padding: const EdgeInsets.all(8.0), // Padding around the icon
//             child: Column(
//               children: [
//                 Icon(
//                   icon,
//                   size: 40, // Larger icon size
//                   color: iconColor,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   tooltip.split(' ')[0], // Show just the name (e.g., "Email", "LinkedIn")
//                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                     color: Theme.of(context).brightness == Brightness.dark ? Colors.white70 : Colors.black54,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//
//               ],
//             ),
//           ),
//         ),
//
//       ],
//     );
//   }
// }
