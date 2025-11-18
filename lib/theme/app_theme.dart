import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0A021A),
    useMaterial3: true,

    fontFamily: GoogleFonts.lexendDeca().fontFamily,

    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF8A3FFC),
      secondary: Color(0xFFB56CFF),
      surface: Color(0xFF14082B),
    ),
  );
}
