import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF7C6FEF);
  static const Color primaryDark = Color(0xFF5B4FD1);
  static const Color primaryLight = Color(0xFFA79BFF);
  static const Color background = Color(0xFFF5F3FF);
  static const Color sidebarBg = Color(0xFFFFFFFF);
  static const Color cardTeal = Color(0xFF5FD3C4);
  static const Color cardTealDark = Color(0xFF3FB6A8);
  static const Color cardBlue = Color(0xFF6FA8FF);
  static const Color cardBlueDark = Color(0xFF4C86E0);
  static const Color cardPink = Color(0xFFFF8FB1);
  static const Color cardPinkDark = Color(0xFFE86590);
  static const Color cardOrange = Color(0xFFFFB366);
  static const Color cardOrangeDark = Color(0xFFE8933D);
  static const Color cardGreen = Color(0xFF7ED987);
  static const Color cardGreenDark = Color(0xFF57BF63);
  static const Color textDark = Color(0xFF2D2A4A);
  static const Color textGrey = Color(0xFF8B87A6);
  static const Color success = Color(0xFF4CAF50);
  static const Color danger = Color(0xFFEF5350);
}

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData.light();
    return base.copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.cardTeal,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        base.textTheme,
      ).apply(bodyColor: AppColors.textDark, displayColor: AppColors.textDark),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textDark),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
