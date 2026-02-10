import 'package:flutter/material.dart';
import 'package:portfolio/component/Project/models/projectModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  Future<void> _launchGitHub() async {
    if (project.githubUrl != null) {
      final Uri url = Uri.parse(project.githubUrl!);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Impossible de lancer ${project.githubUrl}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: const Color(0xFF161B22), // Fond sombre style GitHub
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- AFFICHAGE DE L'IMAGE ---
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              project.imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
              // En cas d'erreur ou d'image manquante
              errorBuilder: (context, error, stackTrace) => Container(
                height: 160,
                color: Colors.white10,
                child: const Icon(Icons.image_outlined, color: Colors.grey),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        project.title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    if (project.githubUrl != null && !project.isSecret)
                      IconButton(
                        onPressed: _launchGitHub,
                        icon: const Icon(Icons.open_in_new,
                            color: Colors.cyanAccent, size: 20),
                        tooltip: "Voir le code",
                      ),
                    if (project.isSecret)
                      const Icon(Icons.lock_outline,
                          color: Colors.amber, size: 18),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  project.desc,
                  style: const TextStyle(
                      color: Colors.grey, fontSize: 13, height: 1.4),
                ),
                const SizedBox(height: 20),
                // --- LES TAGS ---
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.tags
                      .map((tag) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.cyanAccent.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Colors.cyanAccent.withOpacity(0.2)),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                  color: Colors.cyanAccent, fontSize: 10),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
