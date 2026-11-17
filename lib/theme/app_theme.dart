import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const ivory = Color(0xFFFAF8F3);
  static const white = Color(0xFFFFFFFF);

  static const navy = Color(0xFF1F2A44);
  static const beige = Color(0xFFE8DCC8);
  static const gold = Color(0xFFC6A75E);

  static const darkText = Color(0xFF252733);
  static const mutedText = Color(0xFF706B62);

  static const success = Color(0xFF4F8A67);
  static const warning = Color(0xFFC58B3A);
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.ivory,

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.navy,
        primary: AppColors.navy,
        secondary: AppColors.gold,
        surface: AppColors.ivory,
      ),

      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          color: AppColors.navy,
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),

        displayMedium: GoogleFonts.poppins(
          color: AppColors.navy,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),

        headlineSmall: GoogleFonts.poppins(
          color: AppColors.navy,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),

        titleLarge: GoogleFonts.poppins(
          color: AppColors.darkText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),

        bodyLarge: GoogleFonts.inter(
          color: AppColors.darkText,
          fontSize: 16,
        ),

        bodyMedium: GoogleFonts.inter(
          color: AppColors.mutedText,
          fontSize: 14,
        ),

        labelLarge: GoogleFonts.inter(
          color: AppColors.darkText,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 17,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.gold,
            width: 1.5,
          ),
        ),

        hintStyle: GoogleFonts.inter(
          color: AppColors.mutedText,
        ),
      ),
    );
  }
}