import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(60),
      color: const Color(0xFF0D0D12),
      child: Column(
        children: [
          const Text("PRÊT À COLLABORER ?",
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 20),
          const Text(
              "Disponible pour de nouvelles opportunités Flutter & Fullstack",
              textAlign: TextAlign.center),
          const SizedBox(height: 40),
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          Text("© 2026 - Portfolio créé avec Flutter Web",
              style: GoogleFonts.inter(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }
}
