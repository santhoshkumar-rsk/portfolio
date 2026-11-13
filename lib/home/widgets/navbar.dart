import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String _active = 'Home';

  void _scrollToSection(GlobalKey key, String label) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
    setState(() => _active = label);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 650;

    return Container(
      color: const Color(0xff1A0B2E),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            "Santhoshkumar R.",
            style: GoogleFonts.lexendDeca(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),

          if (!isMobile)
            Row(
              children: [
                _navItem("Home", homeKey),
                _navItem("Work", workKey),
                _navItem("Projects", projectKey),
                _navItem("Contact", contactKey),
              ],
            )
          else
            _mobileMenu(),
        ],
      ),
    );
  }

  Widget _navItem(String label, GlobalKey key) {
    final isActive = _active == label;
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: InkWell(
        onTap: () => _scrollToSection(key, label),
        hoverColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.lexendDeca(
                fontSize: 15,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive
                    ? const Color(0xFFB56CFF)
                    : Colors.white.withValues(alpha: 0.80),
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isActive ? 20 : 0,
              height: 2,
              decoration: BoxDecoration(
                color: const Color(0xFFB56CFF),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mobileMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu, color: Colors.white),
      color: const Color(0xff2D1949),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      onSelected: (value) {
        switch (value) {
          case 'Home':
            _scrollToSection(homeKey, 'Home');
          case 'Work':
            _scrollToSection(workKey, 'Work');
          case 'Projects':
            _scrollToSection(projectKey, 'Projects');
          case 'Contact':
            _scrollToSection(contactKey, 'Contact');
        }
      },
      itemBuilder: (_) => ['Home', 'Work', 'Projects', 'Contact']
          .map(
            (label) => PopupMenuItem(
              value: label,
              child: Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
          .toList(),
    );
  }
}
