import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 40 : 70,
      ),
      child: Column(
        children: [
          // Avatar + Text Group
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.center
                : MainAxisAlignment.center,
            children: [
              // Avatar Glow
              Container(
                width: 260,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color(0x00141122),
                    ],
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/png/profile.png", // replace with your avatar
                    fit: BoxFit.cover,
                    width: 135,
                    height: 193,
                  ),
                ),
              ),

              // Text
              Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello! I am Santhoshkumar R",
                    style: GoogleFonts.lexendDeca(
                      fontSize: 16,
                      color: Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 5),
                  _glowingTitle(),
                ],
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Software Engineer line
          Text(
            "I'm a Flutter Developer.",
            textAlign: TextAlign.center,
            style: GoogleFonts.lexendDeca(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // Description
          SizedBox(
            width: 700,
            child: Text(
              "I’m a Flutter Developer with 2.5 years of experience building high-quality apps for Android, iOS, Web, and Windows. I specialize in the full development life cycle—from analysis and architecture to development, testing, and deployment.\n\nMy core strengths include state management (BLoC, GetX), local storage (SQFlite), Firebase integrations, and payment gateway implementations. I’ve successfully developed and published apps on both the Play Store and App Store.\n\nWith additional backend experience from a PHP internship, I work effectively across teams to deliver scalable, user-focused solutions and handle production issues with precision and speed.",
              textAlign: TextAlign.start,
              style: GoogleFonts.lexendDeca(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glowingTitle() {
    return Stack(
      children: [
        // Glow layer
        Text(
          "Pixel-perfect\nwith a purpose..",
          style: GoogleFonts.lexendDeca(
            fontSize: 38,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFB56CFF).withOpacity(0.35),
            shadows: [
              Shadow(
                color: const Color(0xFF8A3FFC).withOpacity(0.5),
                blurRadius: 40,
              ),
            ],
          ),
        ),

        // Main sharp text
        Text(
          "Pixel-perfect\nwith a purpose..",
          style: GoogleFonts.lexendDeca(
            fontSize: 38,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
