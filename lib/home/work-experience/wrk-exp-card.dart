import 'package:flutter/material.dart';

class WorkExperienceCard extends StatefulWidget {
  final String role;
  final String company;
  final String duration;
  final String description;

  const WorkExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  State<WorkExperienceCard> createState() => _WorkExperienceCardState();
}

class _WorkExperienceCardState extends State<WorkExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.role,
          style: TextStyle(
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          widget.company,
          style: TextStyle(
            fontSize: isMobile ? 15 : 16,
            color: const Color(0xFFB56CFF),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          widget.duration,
          style: TextStyle(
            fontSize: isMobile ? 13 : 14,
            color: Colors.white.withValues(alpha: _isHovered ? 1.0 : 0.7),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.description,
          style: TextStyle(
            fontSize: isMobile ? 14 : 15,
            height: 1.6,
            color: Colors.white.withValues(alpha: 0.85),
          ),
        ),
      ],
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: EdgeInsets.all(isMobile ? 18 : 24),
        margin: EdgeInsets.symmetric(vertical: isMobile ? 12 : 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xff2D1949),
              Color(0xff361761),
            ],
          ),
          border: const Border(
            top: BorderSide(color: Color(0xff4C2186), width: 5),
          ),
        ),
        child: isMobile
            ? content
            : Row(
                children: [
                  Container(
                    width: 120,
                    height: 115,
                    margin: const EdgeInsets.only(right: 24, left: 40),
                    child: Image.asset("assets/png/work-exp.png"),
                  ),
                  Expanded(
                    child: content,
                  ),
                ],
              ),
      ),
    );
  }
}
