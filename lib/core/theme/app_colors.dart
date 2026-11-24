import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Backgrounds
  static const Color background = Color(0xFF0A021A);
  static const Color surfaceDark = Color(0xFF14082B);
  static const Color surfaceLight = Color(0xFF1E0D3D);
  static const Color navbarBg = Color(0xFF120524);
  static const Color cardBg = Color(0xFF1A0B2E);
  static const Color cardBgAlt = Color(0xFF261242);

  // Brand Accents
  static const Color primary = Color(0xFF8A3FFC);
  static const Color secondary = Color(0xFFB56CFF);
  static const Color accentCyan = Color(0xFF00D4FF);
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentPurple = Color(0xFF9333EA);

  // Status & Highlights
  static const Color success = Color(0xFF22C55E);
  static const Color successBg = Color(0xFF14532D);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFCBD5E1);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textSubtle = Color(0xFF64748B);

  // Borders & Dividers
  static const Color borderSubtle = Color(0x26B56CFF);
  static const Color borderGlow = Color(0x668A3FFC);
  static const Color borderGlass = Color(0x1FFFFFFF);
  static const Color dividerGlow = Color(0xFF4C2186);

  // Glass overlay colors
  static Color glassBackground = Colors.white.withValues(alpha: 0.05);
  static Color glassBackgroundHover = Colors.white.withValues(alpha: 0.09);
  static Color glassBorder = Colors.white.withValues(alpha: 0.15);
  static Color glassBorderHover = const Color(0xFFB56CFF).withValues(alpha: 0.5);
}
