import 'package:flutter/material.dart';

class HeaderProfileImage extends StatelessWidget {
  const HeaderProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Effet de halo derrière l'image
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.cyanAccent.withOpacity(0.1),
          ),
        ),
        // Bordure stylisée
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: Colors.cyanAccent.withOpacity(0.5), width: 2),
          ),
          child: const CircleAvatar(
            radius: 100,
            backgroundColor: Color(0xFF1A1A2E),
            backgroundImage: AssetImage('assets/images/avatar2.jpg'),
            // Placeholder en attendant ton image réelle
            child: Icon(Icons.person, size: 80, color: Colors.white10),
            // backgroundImage: AssetImage('assets/profile.png'),
          ),
        ),
      ],
    );
  }
}
