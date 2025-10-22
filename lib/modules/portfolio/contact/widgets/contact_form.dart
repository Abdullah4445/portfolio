import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emailjs/emailjs.dart' as EmailJS;

class ContactForm extends StatefulWidget {
  final Color textColor;

  const ContactForm({Key? key, required this.textColor}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      await EmailJS.send(
        'service_hmfsybu',   // 👈 Tumhara Service ID
        'template_t6wgmg0',  // 👈 Tumhara Template ID
        {
          'title': _subjectController.text,   // {{title}}
          'name': _nameController.text,       // {{name}}
          'email': _emailController.text,     // {{email}}
          'message': _messageController.text, // {{message}}
        },
        EmailJS.Options(
          publicKey: 'IlXem-jHUo2vIC2Au', // 👈 Tumhara Public Key
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message sent successfully!")),
      );

      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send: $error")),
      );
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType type = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      maxLines: maxLines,
      validator: (value) => value == null || value.isEmpty ? "Required" : null,
      style: TextStyle(color: widget.textColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: widget.textColor),
        filled: true,
        fillColor: widget.textColor.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.textColor, width: 1.5),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send me a message",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: widget.textColor,
            ),
          ),
          const SizedBox(height: 24),
          _buildTextField(
            controller: _nameController,
            label: "Your Name",
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: "Your Email",
            type: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _subjectController,
            label: "Subject",
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _messageController,
            label: "Message",
            maxLines: 5,
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: _sendEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.textColor,
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child: Text(
                "Send Message",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
