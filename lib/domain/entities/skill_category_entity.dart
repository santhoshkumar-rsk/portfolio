import 'package:flutter/material.dart';

class SkillCategoryEntity {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> skills;

  const SkillCategoryEntity({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.skills,
  });
}
