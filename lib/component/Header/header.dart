import 'package:flutter/material.dart';
import 'package:portfolio/component/Header/headerProfileImage.dart';
import 'package:portfolio/component/Header/headerTextContent.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: isMobile ? 40 : 100, horizontal: screenWidth * 0.1),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F0C29), Color(0xFF302B63)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isMobile
              ? const Column(
                  children: [
                    HeaderProfileImage(),
                    SizedBox(height: 40),
                    HeaderTextContent(isMobile: true),
                  ],
                )
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: HeaderTextContent(isMobile: false)),
                    HeaderProfileImage(),
                  ],
                ),
        ),
      ),
    );
  }
}
