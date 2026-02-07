import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Import pour le lien

class HeaderTextContent extends StatelessWidget {
  final bool isMobile;
  const HeaderTextContent({super.key, required this.isMobile});

  // Fonction pour ouvrir/télécharger le CV
  Future<void> _launchCV() async {
    // Chemin vers ton asset (doit être déclaré dans pubspec.yaml)
    final Uri url = Uri.parse('assets/cv/CVFR.pdf');

    if (!await launchUrl(url)) {
      throw Exception('Impossible de lancer le fichier $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            const Icon(Icons.code, color: Colors.cyanAccent, size: 24),
            const SizedBox(width: 10),
            Text(
              "DEVELOPPEUR FULLSTACK",
              style: GoogleFonts.inter(
                color: Colors.cyanAccent,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          "GASTON Stanley",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.lexend(
            fontSize: isMobile ? 32 : 50,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Fullstack Dev | Flutter | Django | React",
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white70,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 35),
        ElevatedButton.icon(
          onPressed: _launchCV, // Appel de la fonction de téléchargement
          icon: const Icon(Icons.file_download_outlined),
          label: const Text("TÉLÉCHARGER MON CV"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
