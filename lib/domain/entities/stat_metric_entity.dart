import 'package:flutter/material.dart';

class StatMetricEntity {
  final String value;
  final String label;
  final String sublabel;
  final IconData icon;

  const StatMetricEntity({
    required this.value,
    required this.label,
    required this.sublabel,
    required this.icon,
  });
}
