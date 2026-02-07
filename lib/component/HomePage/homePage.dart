import 'package:flutter/material.dart';
import 'package:portfolio/component/Header/header.dart';
import 'package:portfolio/component/Main/mainPage.dart';
import 'package:portfolio/component/Footer/footer.dart';
import 'package:portfolio/component/Main/skills.dart';
import 'package:portfolio/component/NavBar/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Création des clés pour identifier chaque section
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      // On calcule la position du widget par rapport au haut de la page
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuart,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // La NavBar est fixe en haut grâce à l'utilisation du Stack
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Header(key: _headerKey), // On lie la clé ici
                Skills(key: _skillsKey),
                Mainpage(key: _projectsKey),
                Footer(key: _footerKey),
              ],
            ),
          ),
          // Positioned permet de bloquer la NavBar tout en haut
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onTapAccueil: () => _scrollToSection(_headerKey),
              onTapSkills: () => _scrollToSection(_skillsKey),
              onTapProjets: () => _scrollToSection(_projectsKey),
              onTapAbout: () => _scrollToSection(_footerKey),
            ),
          ),
        ],
      ),
    );
  }
}
