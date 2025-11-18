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
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseSpotlight(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Navbar(),
              KeyedSubtree(key: homeKey, child: HeroSection()),
              KeyedSubtree(key: workKey, child: WorkExperienceSection()),
              TechStackSection(),
              Container(
                width: 890,
                height: 800,
                child: Image.asset("assets/png/Skills.png"),
              ),
              KeyedSubtree(key: projectKey, child: ProjectSection()),
              KeyedSubtree(key: contactKey, child: ContactSection()),
            ],
          ),
        ),
      ),
    );
  }
}
