import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String desc;
  final List<String> tags;
  final bool isSecret;
  final String? githubUrl; // Ajout du lien optionnel

  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.tags,
    this.isSecret = false,
    this.githubUrl, // On l'ajoute au constructeur
  });

  // Fonction pour ouvrir le lien
  Future<void> _launchGitHub() async {
    if (githubUrl != null) {
      final Uri url = Uri.parse(githubUrl!);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Impossible de lancer $githubUrl');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(isSecret ? Icons.lock_outline : Icons.rocket_launch,
                  color: Colors.cyanAccent),
              // On affiche l'icône cliquable seulement si un lien existe
              if (githubUrl != null && !isSecret)
                IconButton(
                  onPressed: _launchGitHub,
                  icon: const Icon(Icons.open_in_new,
                      color: Colors.white70, size: 20),
                  tooltip: "Voir sur GitHub",
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: tags
                .map((t) => Chip(
                      label: Text(t, style: const TextStyle(fontSize: 10)),
                      backgroundColor: Colors.cyanAccent.withOpacity(0.1),
                      side: BorderSide.none,
                      visualDensity: VisualDensity.compact,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
