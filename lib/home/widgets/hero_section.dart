import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
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

    _pulseAnim = Tween<double>(begin: 0.95, end: 1.05).animate(
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
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Stack(
      children: [
        // ── Animated particles background ────────────────────────────
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
          child: isMobile ? _mobileLayout() : _desktopLayout(),
        ),
      ],
    );
  }

  // ── Desktop: lottie left · text center/right ──────────────────────
  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Lottie animation
        Expanded(
          flex: 4,
          child: _lottieWidget(),
        ),
        const SizedBox(width: 40),
        // Text block
        Expanded(
          flex: 6,
          child: _textBlock(),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      children: [
        _lottieWidget(),
        const SizedBox(height: 32),
        _textBlock(),
      ],
    );
  }

  // ── Lottie with glow ring ────────────────────────────────────────
  Widget _lottieWidget() {
    return ScaleTransition(
      scale: _pulseAnim,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // outer glow ring
          Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF8A3FFC).withValues(alpha: 0.18),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // inner ring border
          Container(
            width: 270,
            height: 270,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF8A3FFC).withValues(alpha: 0.25),
                width: 1.5,
              ),
            ),
          ),
          // Lottie animation
          SizedBox(
            width: 260,
            height: 260,
            child: Lottie.network(
              'https://assets9.lottiefiles.com/packages/lf20_w51pcehl.json',
              fit: BoxFit.contain,
              errorBuilder: (_, e, s) => _fallbackAvatar(),
            ),
          ),
        ],
      ),
    );
  }

  // Fallback: original profile image if Lottie fails
  Widget _fallbackAvatar() {
    return Container(
      width: 230,
      height: 230,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [Colors.white, Color(0x00141122)],
        ),
      ),
      child: Center(
        child: Image.asset(
          "assets/png/profile.png",
          width: 135,
          height: 193,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ── Text block with typing animation ────────────────────────────
  Widget _textBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Greeting badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF8A3FFC).withValues(alpha: 0.15),
            border: Border.all(
              color: const Color(0xFF8A3FFC).withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.waving_hand_rounded,
                  size: 16, color: Color(0xFFB56CFF)),
              const SizedBox(width: 6),
              Text(
                "Hello! I'm Santhoshkumar R",
                style: GoogleFonts.lexendDeca(
                  fontSize: 13,
                  color: const Color(0xFFB56CFF),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Glowing title
        _glowingTitle(),

        const SizedBox(height: 20),

        // Typing role animation
        Row(
          children: [
            Text(
              "I'm a  ",
              style: GoogleFonts.lexendDeca(
                fontSize: 22,
                color: Colors.white70,
              ),
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Developer.',
                  textStyle: GoogleFonts.lexendDeca(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB56CFF),
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
                TypewriterAnimatedText(
                  'Mobile App Developer.',
                  textStyle: GoogleFonts.lexendDeca(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB56CFF),
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
                TypewriterAnimatedText(
                  'Cross-Platform Engineer.',
                  textStyle: GoogleFonts.lexendDeca(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB56CFF),
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Description
        SizedBox(
          width: 580,
          child: Text(
            "Flutter Developer with 3.5+ years of experience building cross-platform applications for Android, iOS, Web and Windows.\n\n"
            "Skilled in BLoC & GetX, Clean Architecture, MVVM, REST APIs, Firebase, Razorpay, Stripe, Cashfree and SQFlite. "
            "Delivered production apps across healthcare, logistics, event booking and service management domains.",
            textAlign: TextAlign.start,
            style: GoogleFonts.lexendDeca(
              fontSize: 15,
              height: 1.7,
              color: Colors.white70,
            ),
          ),
        ),

        const SizedBox(height: 32),

        // CTA chips – experience & availability
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            _statChip(Icons.work_history_outlined, "3.5+ Years", "Experience"),
            _statChip(Icons.devices_outlined, "4 Platforms", "Android·iOS·Web·Win"),
            _statChip(Icons.circle, "Available", "Open to Work",
                dotColor: const Color(0xFF4CAF50)),
          ],
        ),
      ],
    );
  }

  Widget _glowingTitle() {
    return Stack(
      children: [
        Text(
          "Pixel-perfect\nwith a purpose..",
          style: GoogleFonts.lexendDeca(
            fontSize: 38,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFB56CFF).withValues(alpha: 0.35),
            shadows: [
              Shadow(
                color: const Color(0xFF8A3FFC).withValues(alpha: 0.5),
                blurRadius: 40,
              ),
            ],
          ),
        ),
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

  Widget _statChip(IconData icon, String title, String subtitle,
      {Color? dotColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withValues(alpha: 0.05),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: 16,
              color: dotColor ?? const Color(0xFFB56CFF)),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Animated particle background ──────────────────────────────────────────
class _ParticlePainter extends CustomPainter {
  final double progress;
  static final _random = math.Random(42);
  static final _particles = List.generate(60, (_) => _Particle(_random));

  _ParticlePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _particles) {
      final x = (p.x * size.width + progress * p.speed * size.width) %
          size.width;
      final y = (p.y * size.height +
              progress * p.speed * 0.3 * size.height) %
          size.height;

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
        opacity = rng.nextDouble() * 0.4 + 0.05,
        speed = rng.nextDouble() * 0.3 + 0.05,
        color = [
          const Color(0xFF8A3FFC),
          const Color(0xFFB56CFF),
          Colors.white,
          const Color(0xFF00D4FF),
        ][rng.nextInt(4)];
}
