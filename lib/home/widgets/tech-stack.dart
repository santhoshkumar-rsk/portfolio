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

  final List<Map<String, dynamic>> techList = [
    {"name": "Flutter", "icon": Icons.flutter_dash, "color": Colors.cyanAccent},
    {"name": "Dart", "icon": Icons.code, "color": Colors.blueAccent},
    {"name": "BLoC", "icon": Icons.timeline, "color": Colors.orangeAccent},
    {"name": "GetX", "icon": Icons.bolt, "color": Colors.yellowAccent},
    {"name": "Firebase", "icon": Icons.local_fire_department, "color": Colors.deepOrange},
    {"name": "SQFlite", "icon": Icons.storage, "color": Colors.greenAccent},
    {"name": "Razorpay", "icon": Icons.currency_rupee, "color": Colors.lightBlue},
    {"name": "Stripe", "icon": Icons.payment, "color": Colors.purpleAccent},
    {"name": "Cashfree", "icon": Icons.account_balance_wallet_outlined, "color": Colors.tealAccent},
    {"name": "REST APIs", "icon": Icons.cloud_outlined, "color": Colors.blueGrey},
    {"name": "Git", "icon": Icons.merge_type, "color": Colors.deepOrange},
    {"name": "GitHub", "icon": Icons.code_off, "color": Colors.white},
    {"name": "Android", "icon": Icons.android, "color": Colors.lightGreenAccent},
    {"name": "iOS", "icon": Icons.apple, "color": Colors.white70},
    {"name": "Web", "icon": Icons.web, "color": Colors.lightBlueAccent},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 25), (_) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final next = _scrollController.offset + 1;
        _scrollController.jumpTo(next >= maxScroll ? 0 : next);
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
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFF8A3FFC),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),

          SizedBox(
            height: 110,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: repeatedList.length,
              itemBuilder: (context, index) {
                final item = repeatedList[index];
                return _techCard(
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

  Widget _techCard({
    required String name,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 60),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.06),
              border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Icon(icon, color: color, size: 28),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
