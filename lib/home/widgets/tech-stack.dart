import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class TechStackSection extends StatefulWidget {
  const TechStackSection({super.key});

  @override
  State<TechStackSection> createState() => _TechStackSectionState();
}

class _TechStackSectionState extends State<TechStackSection> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  // Add your tech list here
  final List<Map<String, dynamic>> techList = [
    {"name": "Flutter", "icon": Icons.flutter_dash, "color": Colors.cyanAccent},
    {"name": "Dart", "icon": Icons.code, "color": Colors.blueAccent},
    {"name": "BLoC", "icon": Icons.timeline, "color": Colors.orangeAccent},
    {"name": "GetX", "icon": Icons.bolt, "color": Colors.yellowAccent},
    {"name": "Firebase", "icon": Icons.local_fire_department, "color": Colors.deepOrange},
    {"name": "SQFlite", "icon": Icons.storage, "color": Colors.greenAccent},
    {"name": "Git", "icon": Icons.merge_type, "color": Colors.deepOrange},
    {"name": "GitHub", "icon": Icons.code_off, "color": Colors.white},
    {"name": "Stripe", "icon": Icons.payment, "color": Colors.purpleAccent},
    {"name": "Razorpay", "icon": Icons.currency_rupee, "color": Colors.lightBlue},
    {"name": "PHP", "icon": Icons.php, "color": Colors.indigoAccent},
  ];

  @override
  void initState() {
    super.initState();

    // Auto scroll loop
    _timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(
          (_scrollController.offset + 1) %
              (_scrollController.position.maxScrollExtent + 200),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Duplicate list to create a seamless infinite loop
    final repeatedList = [...techList, ...techList];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tech Stack",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 120,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: repeatedList.length,
              itemBuilder: (context, index) {
                final item = repeatedList[index];
                return _roundedTechCard(
                  name: item["name"],
                  icon: item["icon"],
                  color: item["color"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ==================== ROUNDED CIRCLE GLASS CARD ====================
  Widget _roundedTechCard({
    required String name,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 80),
      child: Column(
        children: [
          // Circle Glass Icon
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.06),
              border: Border.all(color: Colors.white.withOpacity(0.20)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Icon(icon, color: color, size: 32),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
