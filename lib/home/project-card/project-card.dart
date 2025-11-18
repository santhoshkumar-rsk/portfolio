import 'dart:ui';
import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tech;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tech,
    this.onTap,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,

        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(vertical: 16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.06),
          border: Border.all(
            color: Colors.white.withOpacity(0.15),
            width: 1.4,
          ),         
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),

            child: InkWell(
              onTap: widget.onTap,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // DESCRIPTION
                  Text(
                    widget.description,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TECHNOLOGY TAGS
                  Wrap(
                    spacing: 10,
                    runSpacing: 8,
                    children: widget.tech.map((t) {
                      return Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.08),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          t,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
