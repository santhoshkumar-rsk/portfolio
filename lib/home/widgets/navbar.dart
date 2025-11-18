import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 650;

    return Container(
      color: Color(0xff1A0B2E),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            "Santhoshkumar R.",
            style: GoogleFonts.lexendDeca(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          if (!isMobile)
            Row(
              children: [
                TextButton(
                  onPressed: () => scrollToSection(homeKey),
                  child: _navItem("Home"),
                ),
                const SizedBox(width: 30),
                TextButton(
                  onPressed: () => scrollToSection(workKey),
                  child: _navItem("Work"),
                ),
                const SizedBox(width: 30),
                TextButton(
                  onPressed: () => scrollToSection(projectKey),
                  child: _navItem("Project"),
                ),
                const SizedBox(width: 30),
                TextButton(
                  onPressed: () => scrollToSection(contactKey),
                  child: _navItem("Contact"),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _navItem(String text) {
    return Text(
      text,
      style: GoogleFonts.lexendDeca(
        fontSize: 15,
        color: Colors.white.withOpacity(0.85),
      ),
    );
  }
}
