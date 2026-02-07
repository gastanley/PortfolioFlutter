import 'package:flutter/material.dart';
import 'navItem.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onTapAccueil;
  final VoidCallback onTapSkills;
  final VoidCallback onTapProjets;
  final VoidCallback onTapAbout;

  const NavBar({
    super.key,
    required this.onTapAccueil,
    required this.onTapSkills,
    required this.onTapProjets,
    required this.onTapAbout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      color: const Color(0xFF0A0A0B).withOpacity(0.9),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("PORTFOLIO",
              style: TextStyle(
                  color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
          Row(
            children: [
              NavItem(title: "Accueil", onTap: onTapAccueil),
              NavItem(title: "Compétences", onTap: onTapSkills),
              NavItem(title: "Projets", onTap: onTapProjets),
              NavItem(title: "À propos", onTap: onTapAbout),
            ],
          ),
        ],
      ),
    );
  }
}
