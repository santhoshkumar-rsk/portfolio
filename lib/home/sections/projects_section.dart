import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/domain/entities/project_entity.dart';
import 'package:portfolio/home/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: AppStrings.projectsTitle,
            subtitle: AppStrings.projectsSubtitle,
            badgeIcon: Icons.rocket_launch_rounded,
          ),

          // Project Cards
          Column(
            children: PortfolioData.projects.map((project) {
              return _buildProjectCard(project, isMobile);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(ProjectEntity project, bool isMobile) {
    return Container(
      margin: const EdgeInsets.only(bottom: 28),
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.glassBorder),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.cardBg.withValues(alpha: 0.7),
            AppColors.surfaceDark.withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Badges & Store Links Row
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategoryBadges(project),
                    if (_hasStoreLinks(project)) ...[
                      const SizedBox(height: 14),
                      _buildStoreButtons(project),
                    ],
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryBadges(project),
                    if (_hasStoreLinks(project)) _buildStoreButtons(project),
                  ],
                ),

          const SizedBox(height: 16),

          // Project Title
          Text(
            project.title,
            style: GoogleFonts.lexendDeca(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),

          // Description
          Text(
            project.description,
            style: GoogleFonts.lexendDeca(
              fontSize: 14,
              height: 1.6,
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 20),

          // Key Highlights / Contributions
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderSubtle),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 16,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Key Architectural & Engineering Highlights",
                      style: GoogleFonts.lexendDeca(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: project.highlights.map((h) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, right: 10),
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              h,
                              style: GoogleFonts.lexendDeca(
                                fontSize: 13,
                                height: 1.5,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Technologies Tags
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.technologies.map((t) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.glassBackground,
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Text(
                  t,
                  style: GoogleFonts.lexendDeca(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  bool _hasStoreLinks(ProjectEntity project) {
    return project.playStoreUrl != null || project.appStoreUrl != null || project.webUrl != null;
  }

  Widget _buildCategoryBadges(ProjectEntity project) {
    return Wrap(
      spacing: 10,
      runSpacing: 8,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            project.category,
            style: GoogleFonts.lexendDeca(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.accentCyan.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentCyan.withValues(alpha: 0.35),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_rounded,
                size: 14,
                color: AppColors.accentCyan,
              ),
              const SizedBox(width: 4),
              Text(
                project.badge,
                style: GoogleFonts.lexendDeca(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentCyan,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoreButtons(ProjectEntity project) {
    return Wrap(
      spacing: 10,
      runSpacing: 8,
      children: [
        if (project.playStoreUrl != null)
          _buildStoreChip(
            label: "Google Play",
            icon: Icons.shop_two_rounded,
            color: const Color(0xFF00E676),
            url: project.playStoreUrl!,
          ),
        if (project.appStoreUrl != null)
          _buildStoreChip(
            label: "App Store",
            icon: Icons.apple_rounded,
            color: Colors.white,
            url: project.appStoreUrl!,
          ),
        if (project.webUrl != null)
          _buildStoreChip(
            label: "Live Web",
            icon: Icons.language_rounded,
            color: AppColors.accentCyan,
            url: project.webUrl!,
          ),
      ],
    );
  }

  Widget _buildStoreChip({
    required String label,
    required IconData icon,
    required Color color,
    required String url,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.surfaceLight.withValues(alpha: 0.6),
          border: Border.all(
            color: color.withValues(alpha: 0.4),
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.15),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.lexendDeca(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_outward_rounded,
              size: 13,
              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
