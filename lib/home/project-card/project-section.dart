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
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              color: Color(0xFF8A3FFC),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          const SizedBox(height: 40),

          // PROJECT 1 – Clean N Drive
          ProjectCard(
            title: "Clean N Drive",
            subtitle: "Car & Bike Cleaning Service Applications",
            description:
                "Developed two applications end to end: a customer-facing User App and an Employee App. "
                "Integrated Razorpay payments in the User App to support secure checkout for vehicle cleaning services. "
                "Implemented SQFlite storage to support offline access for selected Employee App workflows.",
            tech: ["Flutter", "Dart", "Razorpay", "SQFlite", "Android", "iOS"],
          ),

          // PROJECT 2 – Qure Ortho
          ProjectCard(
            title: "Qure Ortho",
            subtitle: "Healthcare Management Application",
            description:
                "Developed appointment booking and patient management features with role-based modules for Receptionists, "
                "Doctors and Secretaries. Built an interactive SVG-based human body tracking interface to support patient condition monitoring. "
                "Implemented workflows for patient vitals history, consultations and diagnoses.",
            tech: ["Flutter", "Firebase", "SVG", "Role-Based Access", "Android", "iOS"],
          ),

          // PROJECT 3 – Mawalog
          ProjectCard(
            title: "Mawalog",
            subtitle: "Manufacturing, Warehouse & Logistics Management",
            description:
                "Contributed to a 16-application suite supporting manufacturing, warehouse and logistics operations. "
                "Developed and maintained features across 4 applications within the suite, covering real-time tracking, "
                "route optimization, analytics dashboards and cross-department coordination.",
            tech: ["Flutter", "Dart", "Firebase", "MVC", "Android", "iOS", "Web"],
          ),

          // PROJECT 4 – 1 Minute Click
          ProjectCard(
            title: "1 Minute Click",
            subtitle: "Video Engagement & Referral Platform",
            description:
                "Built a cross-platform mobile and web application where users engage with videos and referrals. "
                "Integrated Firebase for authentication and real-time data; worked on payment and transaction handling. "
                "Developed an admin web panel for managing users, content and transactions.",
            tech: ["Flutter", "Firebase", "Firestore", "REST APIs", "Stripe", "Cashfree", "Web"],
          ),

          // PROJECT 5 – Ticketzee
          ProjectCard(
            title: "Ticketzee",
            subtitle: "Event Booking Application",
            description:
                "Revamped mobile and web UI/UX with modern, dark-themed responsive interfaces. "
                "Improved navigation and visual hierarchy across event discovery and booking experiences.",
            tech: ["Flutter", "Firebase", "Responsive UI", "Android", "iOS", "Web"],
          ),
        ],
      ),
    );
  }
}
