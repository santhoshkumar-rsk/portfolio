import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 900;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Section Header ──────────────────────────────────────
              const Text(
                "Let's Connect",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFF8A3FFC),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 32),

              // ── Body Row ─────────────────────────────────────────────
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LEFT – tagline + contact info + socials
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "I'm actively seeking opportunities to collaborate with teams "
                          "that value impactful, user-centered digital experiences.\n"
                          "If you have an idea, a project, or just want to connect — "
                          "I'd love to hear from you.",
                          style: TextStyle(
                            fontSize: 17,
                            height: 1.6,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 36),

                        // ── Quick contact tiles ────────────────────────
                        _contactTile(
                          icon: Icons.email_outlined,
                          label: "Email",
                          value: "santhosh212002@gmail.com",
                          url: "mailto:santhosh212002@gmail.com",
                        ),
                        const SizedBox(height: 14),
                        _contactTile(
                          icon: Icons.phone_outlined,
                          label: "Phone",
                          value: "+91 9361751410",
                          url: "tel:+919361751410",
                        ),
                        const SizedBox(height: 14),
                        _contactTile(
                          icon: Icons.location_on_outlined,
                          label: "Location",
                          value: "Chennai, Tamil Nadu",
                        ),
                        const SizedBox(height: 36),

                        // ── Social icons ───────────────────────────────
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            _socialChip(
                              url:
                                  "https://www.linkedin.com/in/santhoshkumar-r-a8044523b/",
                              icon: "assets/svg/linkedin-02-stroke-rounded.svg",
                              label: "LinkedIn",
                              color: const Color(0xff0A66C2),
                            ),
                            _socialChip(
                              url: "https://github.com/santhoshkumar-rsk",
                              icon: "assets/svg/gitlab-stroke-rounded.svg",
                              label: "GitHub",
                              color: Colors.white,
                            ),
                            _socialChip(
                              url: "mailto:santhosh212002@gmail.com",
                              icon:
                                  "assets/svg/mail-at-sign-01-stroke-rounded.svg",
                              label: "Email",
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: isMobile ? 0 : 60,
                    height: isMobile ? 48 : 0,
                  ),

                  // RIGHT – resume download + portfolio link
                  Expanded(
                    child: _infoCard(),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  // ── Contact Info Tile ──────────────────────────────────────────────────
  Widget _contactTile({
    required IconData icon,
    required String label,
    required String value,
    String? url,
  }) {
    final content = Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF8A3FFC).withValues(alpha: 0.15),
          ),
          child: Icon(icon, color: const Color(0xFFB56CFF), size: 20),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.5),
                letterSpacing: 0.8,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );

    if (url != null) {
      return InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        hoverColor: Colors.transparent,
        child: content,
      );
    }
    return content;
  }

  // ── Social Chip ────────────────────────────────────────────────────────
  Widget _socialChip({
    required String url,
    required String icon,
    required String label,
    required Color color,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withValues(alpha: 0.06),
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon, width: 18, height: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.9),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Info Card (right side) ─────────────────────────────────────────────
  Widget _infoCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff2D1949), Color(0xff1A0B2E)],
        ),
        border: Border.all(color: const Color(0xff4C2186).withValues(alpha: 0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Open to Work",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF4CAF50),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Available for Flutter roles",
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xff4C2186)),
          const SizedBox(height: 20),
          _infoRow(Icons.work_outline, "Experience", "3.5+ Years"),
          const SizedBox(height: 14),
          _infoRow(Icons.devices_outlined, "Platforms", "Android · iOS · Web · Windows"),
          const SizedBox(height: 14),
          _infoRow(Icons.architecture_outlined, "Architecture", "Clean · MVVM · MVC"),
          const SizedBox(height: 14),
          _infoRow(Icons.school_outlined, "Education", "B.Sc · SASTRA University"),

        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFB56CFF), size: 18),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.5),
                letterSpacing: 0.6,
              ),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
