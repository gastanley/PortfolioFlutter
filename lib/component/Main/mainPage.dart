import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/component/Card/projetCard.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Text("MES RÉALISATIONS",
              style: GoogleFonts.lexend(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent)),
          const SizedBox(height: 40),
          const Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: [
              ProjectCard(
                  title: "App Métier (Stage L3)",
                  desc: "Architecture Clean & Riverpod. Projet confidentiel.",
                  tags: ["Flutter", "Dart"],
                  isSecret: true),
              ProjectCard(
                  title: "CodeGen",
                  desc: "Générateur automatique de boilerplate Laravel.",
                  tags: ["Laravel", "PHP", "MySQL"],
                  githubUrl: "https://github.com/gastanley/codeGenAPI.git"),
              ProjectCard(
                  title: "JobWatcher",
                  desc: "Scraping d'offres et interface de suivi temps réel.",
                  tags: ["Python", "Django", "Flutter"],
                  githubUrl: "https://github.com/gastanley/Job_watcher.git"),
              ProjectCard(
                  title: "Mitendry",
                  desc: "Analyse prédictive avec intégration de modèle ML.",
                  tags: ["React TS", "TensorFlow", "Django"],
                  githubUrl: "https://github.com/gastanley/mi-tendry.git"),
              ProjectCard(
                  title: "Portfolio",
                  desc: "Portfolio personnel avec Flutter",
                  tags: ["Flutter", "Dart"],
                  githubUrl: "https://github.com/gastanley/mi-tendry.git"),
            ],
          ),
        ],
      ),
    );
  }
}
