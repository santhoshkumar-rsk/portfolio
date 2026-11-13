import 'package:flutter/material.dart';
import 'package:portfolio/home/work-experience/wrk-exp-card.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 40.0,
        vertical: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Work Experience",
            style: TextStyle(
              fontSize: isMobile ? 26 : 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 3,
            decoration: const BoxDecoration(
              color: Color(0xFF8A3FFC),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          SizedBox(height: isMobile ? 24 : 40),

          const WorkExperienceCard(
            role: "Software Engineer",
            company: "TeamTweaks Technologies",
            duration: "Dec 2025 – Present",
            description:
                "Improve application responsiveness and performance through optimized widget structures and efficient state management. "
                "Implement Clean Architecture and MVVM patterns to support scalable, maintainable codebases. "
                "Build responsive mobile and web application interfaces following modern UI/UX practices. "
                "Deliver feature enhancements and REST API integrations; contribute to code reviews, debugging and production support.",
          ),

          const WorkExperienceCard(
            role: "Software Engineer",
            company: "Lentera Technologies Pvt. Ltd",
            duration: "June 2023 – Nov 2025",
            description:
                "Developed and maintained cross-platform Flutter applications for Android and iOS. "
                "Integrated Firebase Authentication, Firestore and Firebase Cloud Messaging (FCM) push notifications. "
                "Implemented payment gateway integrations using Razorpay, Stripe and Cashfree. "
                "Built responsive UI components and worked on application performance optimization. "
                "Resolved production issues through debugging and bug fixes while collaborating with cross-functional teams.",
          ),
        ],
      ),
    );
  }
}
