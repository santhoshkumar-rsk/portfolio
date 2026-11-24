import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 40),
      decoration: const BoxDecoration(
        color: AppColors.navbarBg,
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      child: Column(
        children: [
          // Quick navigation links
          Wrap(
            spacing: 24,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _buildFooterLink(AppStrings.navHome, homeKey),
              _buildFooterLink(AppStrings.navAbout, aboutKey),
              _buildFooterLink(AppStrings.navSkills, skillsKey),
              _buildFooterLink(AppStrings.navExperience, experienceKey),
              _buildFooterLink(AppStrings.navProjects, projectsKey),
              _buildFooterLink(AppStrings.navEducation, educationKey),
              _buildFooterLink(AppStrings.navContact, contactKey),
            ],
          ),
          const SizedBox(height: 24),

          // Copyright
          Text(
            AppStrings.footerCopyright,
            textAlign: TextAlign.center,
            style: GoogleFonts.lexendDeca(
              fontSize: 13,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 6),

          // Subtext
          Text(
            AppStrings.footerBuiltWith,
            textAlign: TextAlign.center,
            style: GoogleFonts.lexendDeca(
              fontSize: 12,
              color: AppColors.textSubtle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterLink(String label, GlobalKey key) {
    return InkWell(
      onTap: () => scrollToKey(key),
      hoverColor: Colors.transparent,
      child: Text(
        label,
        style: GoogleFonts.lexendDeca(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
