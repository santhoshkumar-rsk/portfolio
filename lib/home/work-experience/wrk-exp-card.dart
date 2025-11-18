import 'dart:ui';
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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(vertical: 20),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xff2D1949),
              Color(0xff361761),
              // deep purple
            ],
          ),

          border: Border(top: BorderSide(color: Color(0xff4C2186),width: 5)),
        ),

        child: Row(
          children: [
            Container(
              width: 120,
              height: 115,
              margin: EdgeInsets.only(right: 24, left: 40),
              child: Image.asset("assets/png/work-exp.png"),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.role,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    widget.company,
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 111, 9, 236).withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    widget.duration,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
