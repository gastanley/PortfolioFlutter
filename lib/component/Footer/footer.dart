import 'dart:convert'; // Requis pour jsonEncode
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http; // Import requis

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  // --- CONFIGURATION EMAILJS ---
  // Remplacez ces valeurs par celles de votre tableau de bord EmailJS
  final String serviceId = 'service_gddj4pj';
  final String templateId = 'template_242o6vp';
  final String publicKey = 'ZB34osorF592R1GHt';

  final String myEmail = "gastonstanley17@gmail.com";
  final String githubUrl = "https://github.com/gastanley";
  final String linkedinUrl =
      "https://www.linkedin.com/in/stanley-gaston-755b21250/";

  // Nouvelle fonction d'envoi direct via EmailJS
  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      // Affichage d'un indicateur de chargement
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Envoi de votre message...")),
      );

      try {
        final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'origin': 'http://localhost',
          },
          body: jsonEncode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': publicKey,
            'template_params': {
              'from_name': _nameController.text,
              'from_email': _emailController.text,
              'message': _messageController.text,
              'reply_to': _emailController.text,
            },
          }),
        );

        print('EmailJS Response Status: ${response.statusCode}');
        print('EmailJS Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // Succès de l'envoi
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();

          if (!mounted) return;
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Message envoyé avec succès !"),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          throw Exception('Erreur serveur: ${response.body}');
        }
      } catch (e) {
        print('EmailJS Error: $e');
        // Gestion de l'erreur
        if (!mounted) return;
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Échec de l'envoi. Veuillez réessayer ou utiliser l'icône email."),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: const Color(0xFF0D0D12),
      child: Column(
        children: [
          const Text("PRÊT À COLLABORER ?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.white)),
          const SizedBox(height: 20),
          const Text(
              "Disponible pour de nouvelles opportunités Flutter & Fullstack",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 40),

          // --- FORMULAIRE DE CONTACT ---
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                      controller: _nameController,
                      label: "Nom",
                      icon: Icons.person),
                  const SizedBox(height: 15),
                  _buildTextField(
                      controller: _emailController,
                      label: "Email",
                      icon: Icons.email,
                      isEmail: true),
                  const SizedBox(height: 15),
                  _buildTextField(
                      controller: _messageController,
                      label: "Message",
                      icon: Icons.message,
                      maxLines: 4),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: _sendEmail,
                    icon: const Icon(Icons.send),
                    label: const Text("ENVOYER UN MESSAGE"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 50),

          // --- BOUTONS RÉSEAUX SOCIAUX ---
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(
                icon: FontAwesomeIcons.github,
                onTap: () => _launchURL(githubUrl),
                tooltip: "GitHub",
              ),
              const SizedBox(width: 20),
              _buildSocialButton(
                icon: FontAwesomeIcons.linkedin,
                onTap: () => _launchURL(linkedinUrl),
                tooltip: "LinkedIn",
              ),
              const SizedBox(width: 20),
              _buildSocialButton(
                icon: Icons.email_outlined,
                onTap: () => _launchURL("mailto:$myEmail"),
                tooltip: "Email direct",
              ),
            ],
          ),

          const SizedBox(height: 40),
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          Text("© 2025 - Portfolio créé avec Flutter Web",
              style: GoogleFonts.inter(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
      {required IconData icon,
      required VoidCallback onTap,
      required String tooltip}) {
    return IconButton(
      onPressed: onTap,
      tooltip: tooltip,
      icon: FaIcon(icon, color: Colors.white70, size: 22),
      style: IconButton.styleFrom(
        hoverColor: Colors.blueAccent.withOpacity(0.1),
        padding: const EdgeInsets.all(12),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isEmail = false,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent, size: 20),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white10),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return "Ce champ est requis";
        if (isEmail && !value.contains('@')) return "Email invalide";
        return null;
      },
    );
  }
}
