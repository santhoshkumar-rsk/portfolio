import 'package:flutter/material.dart';
import 'package:portfolio/common.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/home/sections/about_section.dart';
import 'package:portfolio/home/sections/contact_section.dart';
import 'package:portfolio/home/sections/education_section.dart';
import 'package:portfolio/home/sections/experience_section.dart';
import 'package:portfolio/home/sections/footer_section.dart';
import 'package:portfolio/home/sections/hero_section.dart';
import 'package:portfolio/home/sections/projects_section.dart';
import 'package:portfolio/home/sections/skills_section.dart';
import 'package:portfolio/home/widgets/mouse-lighter.dart';
import 'package:portfolio/home/widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseSpotlight(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Sticky-style Top Navbar
              const Navbar(),

              // 1. Hero Section
              KeyedSubtree(key: homeKey, child: const HeroSection()),
              _buildSectionDivider(),

              // 2. About Me Section
              KeyedSubtree(key: aboutKey, child: const AboutSection()),
              _buildSectionDivider(),

              // 3. Technical Skills Section
              KeyedSubtree(key: skillsKey, child: const SkillsSection()),
              _buildSectionDivider(),

              // 4. Professional Experience Section
              KeyedSubtree(key: experienceKey, child: const ExperienceSection()),
              _buildSectionDivider(),

              // 5. Featured Projects Section
              KeyedSubtree(key: projectsKey, child: const ProjectsSection()),
              _buildSectionDivider(),

              // 6. Education Section
              KeyedSubtree(key: educationKey, child: const EducationSection()),
              _buildSectionDivider(),

              // 7. Contact Section
              KeyedSubtree(key: contactKey, child: const ContactSection()),

              // 8. Footer Section
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.dividerGlow,
            AppColors.primary,
            AppColors.dividerGlow,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
