import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 900;

          return Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= LEFT SIDE =================
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let’s Connect",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "I’m actively seeking opportunities to collaborate with teams\n"
                      "that value impactful, user-centered digital experiences.\n"
                      "If you have an idea, a project, or just want to connect —\n"
                      "I’d love to hear from you.",
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.5,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // SOCIAL ICONS ROW
                    Wrap(
                      spacing: 20,
                      children: [
                        _socialIcon(
                          url: "https://www.linkedin.com/in/santhoshkumar-r-a8044523b/",
                          icon: "assets/svg/linkedin-02-stroke-rounded.svg",
                          color: Color(0xff0A66C2),
                        ),
                        _socialIcon(
                          url: "mailto:santhosh212002@gmail.com",
                          icon: "assets/svg/mail-at-sign-01-stroke-rounded.svg",
                          color: Colors.redAccent,
                        ),
                        _socialIcon(
                          url: "https://github.com/santhoshkumar-rsk",
                          icon: "assets/svg/gitlab-stroke-rounded.svg",
                          color: Colors.white,
                        ),
                        _socialIcon(
                          url: "https://instagram.com",
                          icon: "assets/svg/instagram-stroke-rounded (1).svg",
                          color: Colors.pinkAccent,
                        ),
                         _socialIcon(
                          url: "https://instagram.com",
                          icon: "assets/svg/facebook-02-stroke-rounded.svg",
                          color: Colors.pinkAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: isMobile ? 0 : 60, height: isMobile ? 40 : 0),

              // ================= RIGHT SIDE - FORM =================
              // Expanded(
              //   child: Container(
              //     padding: const EdgeInsets.all(30),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(25),
              //       color: Colors.white.withOpacity(0.05),
              //       border: Border.all(color: Colors.white.withOpacity(0.18)),
              //     ),
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(25),
              //       child: BackdropFilter(
              //         filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              //         child: Column(
              //           children: [
              //             // NAME + EMAIL
              //             Row(
              //               children: [
              //                 Expanded(
              //                   child: _glassTextField(
              //                     controller: _nameController,
              //                     hint: "Your Name",
              //                     widgetIcon: Icons.person_outline,
              //                   ),
              //                 ),
              //                 const SizedBox(width: 20),
              //                 Expanded(
              //                   child: _glassTextField(
              //                     controller: _emailController,
              //                     hint: "Your Email",
              //                     widgetIcon: Icons.email_outlined,
              //                   ),
              //                 ),
              //               ],
              //             ),

              //             const SizedBox(height: 20),

              //             _glassTextField(
              //               controller: _messageController,
              //               hint: "Your Message",
              //               iconPresent: false,
              //               maxLines: 4,
              //             ),

              //             const SizedBox(height: 30),

              //             // SEND BUTTON
              //             Align(
              //               alignment: AlignmentGeometry.centerRight,
              //               child: InkWell(
              //                 onTap: sendMail,
              //                 child: Container(
              //                   padding: const EdgeInsets.symmetric(
              //                     horizontal: 34,
              //                     vertical: 14,
              //                   ),
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(40),
              //                     border: Border.all(
              //                       color: Color(0xffA362FF),
              //                       width: 1.5,
              //                     ),
              //                   ),
              //                   child: const Row(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       Icon(Icons.send, color: Color(0xffA362FF)),
              //                       SizedBox(width: 10),
              //                       Text(
              //                         "Send Message",
              //                         style: TextStyle(
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.bold,
              //                           color: Color(0xffA362FF),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }

  // ===================== SOCIAL ICON (GLASS CIRCLE) =====================
  Widget _socialIcon({
    required String url,
    required String icon,
    required Color color,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.07),
          border: Border.all(color: Colors.white.withOpacity(0.25)),
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }

  // ===================== GLASS TEXT FIELD =====================
  Widget _glassTextField({
    required TextEditingController controller,
    required String hint,
    bool iconPresent = true,
    IconData? widgetIcon,
    int maxLines = 1,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.07),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          iconPresent ? Icon(widgetIcon, color: Colors.white70) : SizedBox(),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===================== SEND MAIL =====================
  void sendMail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'santhosh212002@gmail.com',
      queryParameters: {
        'subject': 'Portfolio Contact Message',
        'body': _messageController.text,
      },
    );
    launchUrl(emailLaunchUri);
  }
}
