import 'package:flutter/material.dart';
import 'package:portfolio/home/work-experience/wrk-exp-card.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Work Experience",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 40),

          WorkExperienceCard(
            role: "Flutter Developer",
            company: "Lentera Technologies Pvt Ltd.",
            duration: "2023 Jun - Present",
            description:
                "Developed and deployed cross-platform mobile apps using Flutter. "
                "Worked with Firebase,\npayment gateways, SQFlite, GetX, and Bloc. "
                "Published apps on Play Store and App Store.",
          ),
        ],
      ),
    );
  }
}
