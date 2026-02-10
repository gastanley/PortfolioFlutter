import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/component/Card/projetCard.dart';
import 'package:portfolio/component/Project/models/projectModel.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  // Cette fonction simule ton futur appel API
  Future<List<ProjectModel>> loadProjects() async {
    // AUJOURD'HUI : On lit le fichier local
    final String response =
        await rootBundle.loadString('assets/data/projects.json');

    // DEMAIN : Tu remplaceras la ligne du haut par celle-ci :
    // final response = await http.get(Uri.parse('https://ton-api-laravel.com/projects'));

    final List<dynamic> data = json.decode(response);
    return data.map((json) => ProjectModel.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProjectModel>>(
      future: loadProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Chargement
        } else if (snapshot.hasError) {
          return const Center(child: Text("Erreur de chargement"));
        } else {
          final projects = snapshot.data!;
          return Wrap(
            spacing: 25,
            runSpacing: 25,
            children: projects.map((p) => ProjectCard(project: p)).toList(),
          );
        }
      },
    );
  }
}
