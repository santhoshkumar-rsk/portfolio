import 'package:flutter/material.dart';
import 'package:portfolio/common.dart';
import 'package:portfolio/home/contact/contact.dart';
import 'package:portfolio/home/project-card/project-section.dart';
import 'package:portfolio/home/widgets/mouse-lighter.dart';
import 'package:portfolio/home/widgets/tech-stack.dart';
import 'package:portfolio/home/work-experience/wrk-exp.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseSpotlight(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Navbar(),
              KeyedSubtree(key: homeKey, child: const HeroSection()),
              _sectionDivider(),
              KeyedSubtree(key: workKey, child: const WorkExperienceSection()),
              _sectionDivider(),
              const TechStackSection(),
              Center(
                child: Image.asset(
                  "assets/png/Skills.png",
                  width: 890,
                ),
              ),
              _sectionDivider(),
              KeyedSubtree(key: projectKey, child: const ProjectSection()),
              _sectionDivider(),
              KeyedSubtree(key: contactKey, child: const ContactSection()),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Color(0xFF4C2186),
            Color(0xFF8A3FFC),
            Color(0xFF4C2186),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _footer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      color: const Color(0xff1A0B2E),
      child: const Text(
        "© 2025 Santhoshkumar R · Built with Flutter",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: Colors.white38,
        ),
      ),
    );
  }
}
