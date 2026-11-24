import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/home/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            title: AppStrings.aboutTitle,
            subtitle: AppStrings.aboutSubtitle,
            badgeIcon: Icons.person_outline_rounded,
          ),

          if (isMobile)
            Column(
              children: [
                _buildNarrative(),
                const SizedBox(height: 32),
                _buildHighlightsGrid(isMobile),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: _buildNarrative()),
                const SizedBox(width: 40),
                Expanded(flex: 5, child: _buildHighlightsGrid(isMobile)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildNarrative() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.glassBorder),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.cardBg.withValues(alpha: 0.6),
            AppColors.surfaceDark.withValues(alpha: 0.4),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: AppColors.secondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                "Engineering Philosophy",
                style: GoogleFonts.lexendDeca(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "I am a passionate Flutter Developer with 3.5+ years of hands-on experience building, architecting, and optimizing production applications for Android, iOS, Web, and Windows.",
            style: GoogleFonts.lexendDeca(
              fontSize: 15,
              height: 1.7,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "My engineering approach centers around Clean Architecture and MVVM/BLoC patterns. I believe well-structured code is not just about writing features today—it is about ensuring codebases remain maintainable, testable, and seamless for distributed teams to scale over time.",
            style: GoogleFonts.lexendDeca(
              fontSize: 15,
              height: 1.7,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "From integrating complex payment gateways (Razorpay, Stripe, Cashfree) and offline-first data caching with SQFlite, to deploying across the Google Play Store and Apple App Store, I focus on delivering seamless end-to-end user experiences.",
            style: GoogleFonts.lexendDeca(
              fontSize: 15,
              height: 1.7,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightsGrid(bool isMobile) {
    final pillars = [
      {
        "title": "Clean Architecture & MVVM",
        "desc": "Separation of concerns across data, domain, and presentation layers for long-term scalability.",
        "icon": Icons.architecture_rounded,
        "color": AppColors.secondary,
      },
      {
        "title": "State Management (BLoC & GetX)",
        "desc": "Predictable, event-driven state streams preventing unnecessary rebuilds and memory overhead.",
        "icon": Icons.speed_rounded,
        "color": AppColors.accentCyan,
      },
      {
        "title": "Payments & Offline-First",
        "desc": "Secure checkouts (Razorpay, Stripe) combined with SQFlite local persistence for seamless workflows.",
        "icon": Icons.shield_rounded,
        "color": AppColors.success,
      },
      {
        "title": "Store Deployment & Lifecycle",
        "desc": "End-to-end release management across Apple App Store and Google Play Console with CI/CD.",
        "icon": Icons.cloud_upload_rounded,
        "color": AppColors.accentBlue,
      },
    ];

    return Column(
      children: pillars.map((p) {
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.glassBackground,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: (p["color"] as Color).withValues(alpha: 0.15),
                ),
                child: Icon(
                  p["icon"] as IconData,
                  color: p["color"] as Color,
                  size: 22,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p["title"] as String,
                      style: GoogleFonts.lexendDeca(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      p["desc"] as String,
                      style: GoogleFonts.lexendDeca(
                        fontSize: 13,
                        height: 1.5,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
