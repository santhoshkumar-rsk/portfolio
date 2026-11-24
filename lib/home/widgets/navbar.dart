import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String _active = AppStrings.navHome;

  void _onNavTap(String label, GlobalKey key) {
    setState(() => _active = label);
    scrollToKey(key);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 1024;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.navbarBg.withValues(alpha: 0.9),
        border: const Border(
          bottom: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo / Brand
          InkWell(
            onTap: () => _onNavTap(AppStrings.navHome, homeKey),
            hoverColor: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary],
                    ),
                  ),
                  child: const Icon(
                    Icons.flutter_dash,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  AppStrings.name,
                  style: GoogleFonts.lexendDeca(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),

          if (!isMobile)
            Row(
              children: [
                _buildNavItem(AppStrings.navHome, homeKey),
                _buildNavItem(AppStrings.navAbout, aboutKey),
                _buildNavItem(AppStrings.navSkills, skillsKey),
                _buildNavItem(AppStrings.navExperience, experienceKey),
                _buildNavItem(AppStrings.navProjects, projectsKey),
                _buildNavItem(AppStrings.navEducation, educationKey),
                _buildNavItem(AppStrings.navContact, contactKey),
                const SizedBox(width: 24),

                // Resume Button
                InkWell(
                  onTap: () => scrollToKey(contactKey),
                  hoverColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.secondary],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.file_download_outlined, color: Colors.white, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          AppStrings.resumeDownload,
                          style: GoogleFonts.lexendDeca(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          else
            _buildMobileMenu(),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, GlobalKey key) {
    final isActive = _active == label;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: () => _onNavTap(label, key),
        hoverColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.lexendDeca(
                fontSize: 14,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? AppColors.secondary : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isActive ? 18 : 0,
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenu() {
    final items = [
      {"label": AppStrings.navHome, "key": homeKey},
      {"label": AppStrings.navAbout, "key": aboutKey},
      {"label": AppStrings.navSkills, "key": skillsKey},
      {"label": AppStrings.navExperience, "key": experienceKey},
      {"label": AppStrings.navProjects, "key": projectsKey},
      {"label": AppStrings.navEducation, "key": educationKey},
      {"label": AppStrings.navContact, "key": contactKey},
    ];

    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu_rounded, color: Colors.white),
      color: AppColors.cardBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (val) {
        final match = items.firstWhere((it) => it["label"] == val);
        _onNavTap(val, match["key"] as GlobalKey);
      },
      itemBuilder: (_) => items.map((item) {
        final label = item["label"] as String;
        return PopupMenuItem(
          value: label,
          child: Text(
            label,
            style: GoogleFonts.lexendDeca(
              color: AppColors.textPrimary,
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }
}
