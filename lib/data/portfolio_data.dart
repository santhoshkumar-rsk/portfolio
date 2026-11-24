import 'package:flutter/material.dart';
import 'package:portfolio/domain/entities/education_entity.dart';
import 'package:portfolio/domain/entities/experience_entity.dart';
import 'package:portfolio/domain/entities/project_entity.dart';
import 'package:portfolio/domain/entities/skill_category_entity.dart';
import 'package:portfolio/domain/entities/stat_metric_entity.dart';

class PortfolioData {
  PortfolioData._();

  // Highlight Stats
  static const List<StatMetricEntity> stats = [
    StatMetricEntity(
      value: "3.5+",
      label: "Years Experience",
      sublabel: "Cross-platform mobile & web",
      icon: Icons.timeline_rounded,
    ),
    StatMetricEntity(
      value: "5+",
      label: "Production Apps",
      sublabel: "Delivered to App & Play Stores",
      icon: Icons.rocket_launch_rounded,
    ),
    StatMetricEntity(
      value: "16",
      label: "Logistics Suite Apps",
      sublabel: "Enterprise Mawalog platform",
      icon: Icons.hub_rounded,
    ),
    StatMetricEntity(
      value: "4",
      label: "Target Platforms",
      sublabel: "Android · iOS · Web · Windows",
      icon: Icons.devices_rounded,
    ),
  ];

  // Technical Skills Categories
  static const List<SkillCategoryEntity> skillCategories = [
    SkillCategoryEntity(
      title: "Programming Languages",
      subtitle: "Core languages powering native and cross-platform development",
      icon: Icons.code_rounded,
      skills: ["Dart", "Flutter", "Swift"],
    ),
    SkillCategoryEntity(
      title: "Mobile Development",
      subtitle: "Building cross-platform and native high-performance apps",
      icon: Icons.phone_android_rounded,
      skills: [
        "Flutter",
        "Android",
        "iOS",
        "Web",
        "Windows",
        "Responsive UI/UX",
      ],
    ),
    SkillCategoryEntity(
      title: "Architecture & State Management",
      subtitle: "Designing maintainable, scalable, and testable codebases",
      icon: Icons.account_tree_rounded,
      skills: [
        "Clean Architecture",
        "BLoC",
        "GetX",
        "MVVM",
        "MVC",
        "SOLID Principles",
        "Dependency Injection",
      ],
    ),
    SkillCategoryEntity(
      title: "Backend, Cloud & APIs",
      subtitle: "Integrating cloud infrastructure, authentication, and live feeds",
      icon: Icons.cloud_done_rounded,
      skills: [
        "REST APIs",
        "Firebase Auth",
        "Firestore",
        "FCM Push Notifications",
        "Offline-First Sync",
      ],
    ),
    SkillCategoryEntity(
      title: "Databases & Local Storage",
      subtitle: "Reliable persistent storage and offline workflow management",
      icon: Icons.storage_rounded,
      skills: [
        "SQFlite",
        "Cloud Firestore",
        "Local Caching",
        "Data Encryption",
      ],
    ),
    SkillCategoryEntity(
      title: "Payments, Tools & Deployment",
      subtitle: "Secure payment checkouts, version control, and store releases",
      icon: Icons.build_circle_rounded,
      skills: [
        "Razorpay",
        "Stripe",
        "Cashfree",
        "Google Play Store",
        "Apple App Store",
        "Git",
        "GitHub",
        "VS Code",
        "Android Studio",
      ],
    ),
  ];

  // Marquee tech pills
  static const List<Map<String, dynamic>> marqueeTech = [
    {"name": "Flutter", "icon": Icons.flutter_dash, "color": Color(0xFF00D4FF)},
    {"name": "Dart", "icon": Icons.code, "color": Color(0xFF3B82F6)},
    {"name": "BLoC", "icon": Icons.timeline, "color": Color(0xFFF59E0B)},
    {"name": "GetX", "icon": Icons.bolt, "color": Color(0xFFEAB308)},
    {"name": "Clean Architecture", "icon": Icons.architecture, "color": Color(0xFFB56CFF)},
    {"name": "Firebase", "icon": Icons.local_fire_department, "color": Color(0xFFF97316)},
    {"name": "SQFlite", "icon": Icons.storage, "color": Color(0xFF10B981)},
    {"name": "Razorpay", "icon": Icons.currency_rupee, "color": Color(0xFF06B6D4)},
    {"name": "Stripe", "icon": Icons.payment, "color": Color(0xFF8B5CF6)},
    {"name": "Cashfree", "icon": Icons.account_balance_wallet, "color": Color(0xFF14B8A6)},
    {"name": "REST APIs", "icon": Icons.cloud_sync, "color": Color(0xFF60A5FA)},
    {"name": "Android", "icon": Icons.android, "color": Color(0xFF4ADE80)},
    {"name": "iOS", "icon": Icons.apple, "color": Color(0xFFE2E8F0)},
  ];

  // Professional Experience
  static const List<ExperienceEntity> experiences = [
    ExperienceEntity(
      role: "Software Engineer",
      company: "TeamTweaks Technologies",
      duration: "Dec 2025 – Present",
      location: "Chennai, Tamil Nadu, India",
      description:
          "Improving application responsiveness, implementing clean architectural designs, and delivering production mobile and web interfaces with modern UI/UX practices.",
      responsibilities: [
        "Improve application responsiveness and performance through optimized widget structures and efficient state management.",
        "Implement Clean Architecture and MVVM patterns to support scalable, maintainable enterprise codebases.",
        "Build responsive mobile and web application interfaces following modern UI/UX best practices.",
        "Deliver feature enhancements and REST API integrations; contribute to code reviews, debugging, and production support.",
      ],
      technologies: [
        "Flutter",
        "Dart",
        "BLoC",
        "Clean Architecture",
        "MVVM",
        "REST APIs",
        "Web",
        "iOS",
        "Android",
      ],
    ),
    ExperienceEntity(
      role: "Software Engineer",
      company: "Lentera Technologies Pvt. Ltd",
      duration: "June 2023 – Nov 2025",
      location: "Chennai, Tamil Nadu, India",
      description:
          "Developed cross-platform Flutter applications for Android and iOS, integrated payments, Firebase services, and optimized app performance.",
      responsibilities: [
        "Developed and maintained cross-platform Flutter applications for Android and iOS across healthcare, logistics, and service domains.",
        "Integrated Firebase Authentication, Firestore, and Firebase Cloud Messaging (FCM) push notifications.",
        "Implemented secure payment gateway integrations using Razorpay, Stripe, and Cashfree.",
        "Built responsive UI components and worked actively on application performance optimization.",
        "Resolved production issues through systematic debugging while collaborating with cross-functional teams.",
      ],
      technologies: [
        "Flutter",
        "Dart",
        "Firebase",
        "Firestore",
        "FCM",
        "Razorpay",
        "Stripe",
        "Cashfree",
        "SQFlite",
        "GetX",
      ],
    ),
  ];

  // Featured Projects
  static const List<ProjectEntity> projects = [
    ProjectEntity(
      id: "clean-n-drive",
      title: "Clean N Drive",
      category: "Service Booking & Management",
      badge: "End-to-End Delivery",
      description:
          "Car & bike cleaning service applications developed end to end: a customer-facing User App for booking services and an Employee App for tracking and servicing tasks.",
      highlights: [
        "Developed two separate applications end to end: User App and Employee App.",
        "Integrated Razorpay payment gateway in the User App for secure checkout.",
        "Implemented SQFlite local storage to support offline access for employee service workflows.",
        "Engineered real-time order status tracking and push notifications for service updates.",
      ],
      technologies: ["Flutter", "Dart", "Razorpay", "SQFlite", "Android", "iOS"],
      iconAsset: "assets/png/work-exp.png",
    ),
    ProjectEntity(
      id: "qure-ortho",
      title: "Qure Ortho",
      category: "Healthcare SaaS",
      badge: "Interactive SVG Body Tracker",
      description:
          "Comprehensive healthcare management application providing role-based modules for Receptionists, Doctors, and Secretaries, paired with interactive patient diagnosis tracking.",
      highlights: [
        "Developed appointment booking and patient management workflows with strict role-based access control.",
        "Built an interactive SVG-based human body tracking interface to monitor and record patient conditions.",
        "Implemented workflows for patient vitals history, digital consultations, and prescription diagnoses.",
        "Optimized patient records rendering and report generation for clinic operations.",
      ],
      technologies: ["Flutter", "Firebase", "SVG", "Role-Based Access", "Android", "iOS"],
      iconAsset: "assets/png/work-exp.png",
    ),
    ProjectEntity(
      id: "mawalog",
      title: "Mawalog",
      category: "Manufacturing & Logistics Suite",
      badge: "16-App Enterprise Suite",
      description:
          "Contributed to a large-scale 16-application logistics suite supporting manufacturing, warehouse operations, shipment dispatch, and fleet management.",
      highlights: [
        "Developed and maintained features across 4 specialized applications within the 16-app logistics suite.",
        "Engineered route tracking, warehouse inventory synchronization, and dispatch schedules.",
        "Implemented real-time status updates and cross-department telemetry dashboards.",
        "Maintained high code maintainability with MVC architecture and modular code separation.",
      ],
      technologies: ["Flutter", "Dart", "Firebase", "MVC", "Android", "iOS", "Web"],
      iconAsset: "assets/png/work-exp.png",
    ),
    ProjectEntity(
      id: "1-minute-click",
      title: "1 Minute Click",
      category: "Video Engagement & Referral",
      badge: "Mobile & Web Admin Panel",
      description:
          "Cross-platform mobile and web application where users engage with videos, participate in referral networks, and manage digital earnings with an admin management dashboard.",
      highlights: [
        "Built cross-platform mobile and web interfaces with seamless video engagement features.",
        "Integrated Firebase Authentication and Firestore for high-throughput real-time data.",
        "Implemented secure payment and transaction workflows utilizing Stripe and Cashfree.",
        "Developed an admin web panel for managing users, video content, and payout transactions.",
      ],
      technologies: ["Flutter", "Firebase", "Firestore", "REST APIs", "Stripe", "Cashfree", "Web"],
      iconAsset: "assets/png/work-exp.png",
    ),
    ProjectEntity(
      id: "ticketzee",
      title: "Ticketzee",
      category: "Event Booking & Discovery",
      badge: "Modern Dark UI/UX Revamp",
      description:
          "Revamped event booking application featuring modern dark-themed responsive interfaces, streamlined discovery, and quick seat reservation workflows.",
      highlights: [
        "Redesigned mobile and web UI/UX with modern, dark-themed responsive glassmorphism interfaces.",
        "Improved navigation flow and visual hierarchy across event discovery and ticket checkout.",
        "Integrated interactive event maps, category filters, and immediate ticket confirmation.",
        "Collaborated with cross-functional stakeholders to elevate user retention and conversion rates.",
      ],
      technologies: ["Flutter", "Firebase", "Responsive UI", "Android", "iOS", "Web"],
      iconAsset: "assets/png/work-exp.png",
    ),
  ];

  // Education
  static const List<EducationEntity> educations = [
    EducationEntity(
      degree: "Bachelor of Science",
      shortCode: "B.Sc",
      institution: "Srinivasa Ramanujam Centre (SASTRA University)",
      duration: "2019 – 2022",
      score: "CGPA: 6.40 | Year of Passing: 2022",
      description:
          "Graduated with a strong academic foundation in Computer Science, Data Structures, Algorithms, Object-Oriented Programming, and Software Engineering Principles.",
    ),
  ];
}
