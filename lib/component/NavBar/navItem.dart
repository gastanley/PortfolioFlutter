import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  // Le constructeur doit rester simple pour éviter l'erreur de compilation
  const NavItem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
