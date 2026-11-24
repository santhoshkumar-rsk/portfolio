import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/common.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _particleController;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _pulseAnim = Tween<double>(begin: 0.96, end: 1.04).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Stack(
      children: [
        // Particle background
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _particleController,
            builder: (context, _) => CustomPaint(
              painter: _ParticlePainter(_particleController.value),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: isMobile ? 40 : 70,
          ),
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Avatar / Lottie
        Expanded(
          flex: 4,
          child: _buildAvatarLottie(),
        ),
        const SizedBox(width: 48),
        // Content Block
        Expanded(
          flex: 6,
          child: _buildContentBlock(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildAvatarLottie(),
        const SizedBox(height: 36),
        _buildContentBlock(),
      ],
    );
  }

  Widget _buildAvatarLottie() {
    return ScaleTransition(
      scale: _pulseAnim,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer blur glow
          Container(
            width: 330,
            height: 330,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.25),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Inner border ring
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.secondary.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
          ),
          // Lottie or Profile Image
          SizedBox(
            width: 260,
            height: 260,
            child: Lottie.network(
              'https://assets9.lottiefiles.com/packages/lf20_w51pcehl.json',
              fit: BoxFit.contain,
              errorBuilder: (_, e, s) => _buildFallbackProfile(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackProfile() {
    return Container(
      width: 240,
      height: 240,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [Colors.white, Color(0x00141122)],
        ),
      ),
      child: Center(
        child: Image.asset(
          "assets/png/profile.png",
          width: 140,
          height: 195,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContentBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Availability Status Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.success.withValues(alpha: 0.7),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                AppStrings.statusAvailable,
                style: GoogleFonts.lexendDeca(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Glowing Main Title
        _buildGlowingTitle(),

        const SizedBox(height: 16),

        // Typing dynamic subtitle
        Row(
          children: [
            Text(
              AppStrings.heroLeadPrefix,
              style: GoogleFonts.lexendDeca(
                fontSize: 24,
                color: AppColors.textSecondary,
              ),
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: AppStrings.heroTypingTitles.map((title) {
                return TypewriterAnimatedText(
                  title,
                  textStyle: GoogleFonts.lexendDeca(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                  speed: const Duration(milliseconds: 70),
                );
              }).toList(),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Summary Text
        SizedBox(
          width: 620,
          child: Text(
            AppStrings.heroDescription,
            style: GoogleFonts.lexendDeca(
              fontSize: 15,
              height: 1.7,
              color: AppColors.textSecondary,
            ),
          ),
        ),

        const SizedBox(height: 32),

        // Action Buttons Row
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            // Download / View Resume
            InkWell(
              onTap: () => scrollToKey(contactKey),
              hoverColor: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.description_outlined, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      AppStrings.btnDownloadResume,
                      style: GoogleFonts.lexendDeca(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // View Projects CTA
            InkWell(
              onTap: () => scrollToKey(projectsKey),
              hoverColor: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.glassBackground,
                  border: Border.all(color: AppColors.glassBorder),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.rocket_launch_outlined, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      AppStrings.btnViewProjects,
                      style: GoogleFonts.lexendDeca(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        // Social Links
        Row(
          children: [
            _buildSocialIcon(
              icon: Icons.code_rounded,
              url: AppStrings.githubUrl,
              label: "GitHub",
            ),
            const SizedBox(width: 14),
            _buildSocialIcon(
              icon: Icons.business_center_rounded,
              url: AppStrings.linkedinUrl,
              label: "LinkedIn",
            ),
            const SizedBox(width: 14),
            _buildSocialIcon(
              icon: Icons.email_rounded,
              url: "mailto:${AppStrings.email}",
              label: "Email",
            ),
          ],
        ),

        const SizedBox(height: 36),

        // Quick Stats Chips
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: PortfolioData.stats.map((stat) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.glassBackground,
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(stat.icon, size: 18, color: AppColors.secondary),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stat.value,
                        style: GoogleFonts.lexendDeca(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        stat.label,
                        style: GoogleFonts.lexendDeca(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildGlowingTitle() {
    return Stack(
      children: [
        Text(
          AppStrings.heroTitleGlow,
          style: GoogleFonts.lexendDeca(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            color: AppColors.secondary.withValues(alpha: 0.35),
            shadows: [
              Shadow(
                color: AppColors.primary.withValues(alpha: 0.6),
                blurRadius: 40,
              ),
            ],
          ),
        ),
        Text(
          AppStrings.heroTitleGlow,
          style: GoogleFonts.lexendDeca(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String url,
    required String label,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.glassBackground,
          border: Border.all(color: AppColors.glassBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.secondary),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.lexendDeca(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final double progress;
  static final _random = math.Random(42);
  static final _particles = List.generate(45, (_) => _Particle(_random));

  _ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _particles) {
      final x = (p.x * size.width + progress * p.speed * size.width) % size.width;
      final y = (p.y * size.height + progress * p.speed * 0.3 * size.height) % size.height;

      final paint = Paint()
        ..color = p.color.withValues(alpha: p.opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

      canvas.drawCircle(Offset(x, y), p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) => old.progress != progress;
}

class _Particle {
  final double x;
  final double y;
  final double radius;
  final double opacity;
  final double speed;
  final Color color;

  _Particle(math.Random rng)
      : x = rng.nextDouble(),
        y = rng.nextDouble(),
        radius = rng.nextDouble() * 2 + 0.5,
        opacity = rng.nextDouble() * 0.35 + 0.05,
        speed = rng.nextDouble() * 0.25 + 0.05,
        color = [
          AppColors.primary,
          AppColors.secondary,
          AppColors.accentCyan,
          Colors.white,
        ][rng.nextInt(4)];
}
