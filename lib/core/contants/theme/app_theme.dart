import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Backgrounds
  static const Color bgPrimary = Color(0xFFF1F1EE);
  static const Color bgSecondary = Color(0xFF1A1D35);
  static const Color bgCard = Color(0xFF1E2240);
  static const Color bgSidebar = Color(0xFFFFFFFF);
  static const Color bgRight = Color(0xFF1A1D35);

  // Accent / Brand
  static const Color accentPurple = Color(0xFF7B5CF0);
  static const Color accentPurpleLight = Color(0xFF9D7FF5);
  static const Color accentPink = Color(0xFFE879A0);
  static const Color accentBlue = Color(0xFF4C6EF5);
  static const Color accentGold = Color(0xFFFFCC4D);

  // Hero gradient
  static const Color heroStart = Color(0xFFB06AB3);
  static const Color heroEnd = Color(0xFF4568DC);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B7D3);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color textDark = Color(0xFF1A1D35);
  static const Color textSidebarActive = Color(0xFF1A1D35);
  static const Color textSidebarInactive = Color(0xFF6B7280);

  // Chart
  static const Color chartPurple = Color(0xFF7B5CF0);
  static const Color chartPink = Color(0xFFE879A0);

  // Highlight
  static const Color selectedProject = Color(0xFFE84393);
  static const Color calendarHighlight = Color(0xFF7B5CF0);
  static const Color calendarToday = Color(0xFF4C6EF5);
}

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accentPurple,
      secondary: AppColors.accentPink,
      surface: AppColors.bgCard,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    scaffoldBackgroundColor: AppColors.bgPrimary,
  );
}
