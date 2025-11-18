import 'package:flutter/material.dart';
import 'package:portfolio/home/project-card/project-card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 40),

          // PROJECT 1
          ProjectCard(
            title: "Mawalog",
            description:
                "Developed a comprehensive mobile and web suite to optimize manufacturing, warehouse, and logistics "
                "operations with real-time tracking, route optimization, and analytics dashboards. Implemented automation,"
                "role-based access, and cross-department coordination to enhance efficiency, accuracy, and decision-making",
            tech: ["Flutter", "Firebase", "GetX", "iOS", "Windows", "Web"],
          ),

          // PROJECT 2
          ProjectCard(
            title: "1 minute click",
            description:
                "Developed a cross-platform mobile and web application enabling users to earn through video engagement"
                "and referrals, with integrated Firebase for real-time data and secure payment processing. Built an admin web"
                "panel for managing users, content, and transactions efficiently.",
            tech: ["Flutter", "Firebase", "GetX", "Web", "Stripe", "Cashfree"],
          ),

          // PROJECT 3
          ProjectCard(
            title: "Ticketzee (Mobile)  ",
            description:
                "Revamped the UI/UX design of Ticketzee, enhancing the user experience for browsing and booking cultural events and concerts. Focused on creating a modern, intuitive dark-themed interface while maintaining usability and accessibility across devices. Introduced streamlined navigation and improved visual hierarchy to simplify the event discovery and booking process. Collaborated closely with developers and stakeholders",
            tech: ["Flutter", "SQLite", "iOS", "RazorPay", "Firebase","GetX"],
          ),
        ],
      ),
    );
  }
}
