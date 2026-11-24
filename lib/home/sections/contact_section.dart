import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/home/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendEmail() {
    final name = _nameController.text.trim();
    final senderEmail = _emailController.text.trim();
    final message = _messageController.text.trim();

    final body = "Name: $name\nEmail: $senderEmail\n\nMessage:\n$message";
    final Uri uri = Uri(
      scheme: 'mailto',
      path: AppStrings.email,
      queryParameters: {
        'subject': 'Portfolio Inquiry from $name',
        'body': body,
      },
    );
    launchUrl(uri);
  }

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
            title: AppStrings.contactTitle,
            subtitle: AppStrings.contactSubtitle,
            badgeIcon: Icons.alternate_email_rounded,
          ),

          if (isMobile)
            Column(
              children: [
                _buildInfoCards(),
                const SizedBox(height: 32),
                _buildMessageCard(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _buildInfoCards()),
                const SizedBox(width: 40),
                Expanded(flex: 6, child: _buildMessageCard()),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildInfoCards() {
    return Column(
      children: [
        _buildContactTile(
          icon: Icons.email_rounded,
          label: "EMAIL ADDRESS",
          value: AppStrings.email,
          url: "mailto:${AppStrings.email}",
        ),
        const SizedBox(height: 14),
        _buildContactTile(
          icon: Icons.phone_rounded,
          label: "PHONE NUMBER",
          value: AppStrings.phone,
          url: "tel:${AppStrings.phone}",
        ),
        const SizedBox(height: 14),
        _buildContactTile(
          icon: Icons.location_on_rounded,
          label: "LOCATION",
          value: AppStrings.location,
        ),
        const SizedBox(height: 24),

        // Social Chips
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            _buildSocialChip(
              icon: Icons.business_center_rounded,
              label: "LinkedIn",
              url: AppStrings.linkedinUrl,
            ),
            _buildSocialChip(
              icon: Icons.code_rounded,
              label: "GitHub",
              url: AppStrings.githubUrl,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Availability status card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.borderGlow),
          ),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.success,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.success.withValues(alpha: 0.8),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Open for New Opportunities",
                      style: GoogleFonts.lexendDeca(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Available for Flutter & Cross-Platform Mobile roles.",
                      style: GoogleFonts.lexendDeca(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String label,
    required String value,
    String? url,
  }) {
    final content = Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.glassBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.18),
            ),
            child: Icon(icon, color: AppColors.secondary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.lexendDeca(
                    fontSize: 11,
                    letterSpacing: 1.1,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.lexendDeca(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          if (url != null)
            const Icon(
              Icons.arrow_outward_rounded,
              color: AppColors.secondary,
              size: 18,
            ),
        ],
      ),
    );

    if (url != null) {
      return InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        child: content,
      );
    }
    return content;
  }

  Widget _buildSocialChip({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.surfaceLight.withValues(alpha: 0.5),
          border: Border.all(color: AppColors.borderSubtle),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.secondary),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.lexendDeca(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageCard() {
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
            AppColors.cardBg.withValues(alpha: 0.7),
            AppColors.surfaceDark.withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send a Message",
            style: GoogleFonts.lexendDeca(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Have a project or opportunity? Let's connect directly via email.",
            style: GoogleFonts.lexendDeca(
              fontSize: 13,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 24),

          // Name Field
          _buildTextField(
            controller: _nameController,
            hint: "Your Name",
            icon: Icons.person_outline_rounded,
          ),
          const SizedBox(height: 16),

          // Email Field
          _buildTextField(
            controller: _emailController,
            hint: "Your Email Address",
            icon: Icons.mail_outline_rounded,
          ),
          const SizedBox(height: 16),

          // Message Field
          _buildTextField(
            controller: _messageController,
            hint: "Share details about the role, project, or collaboration...",
            icon: Icons.chat_bubble_outline_rounded,
            maxLines: 4,
          ),
          const SizedBox(height: 24),

          // Send Button
          InkWell(
            onTap: _sendEmail,
            hoverColor: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.send_rounded, color: Colors.white, size: 18),
                  const SizedBox(width: 10),
                  Text(
                    "Send Message",
                    style: GoogleFonts.lexendDeca(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: GoogleFonts.lexendDeca(
          color: AppColors.textPrimary,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          icon: Icon(icon, color: AppColors.secondary, size: 18),
          hintText: hint,
          hintStyle: GoogleFonts.lexendDeca(
            color: AppColors.textMuted,
            fontSize: 13,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
