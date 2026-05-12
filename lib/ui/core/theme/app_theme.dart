import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const background = Color(0xFFFBF9FC);
  static const foreground = Color(0xFF2B1F33);
  static const mutedForeground = Color(0xFF7B7281);

  static const primary = Color(0xFFCC3DA6);
  static const primaryFg = Color(0xFFFFFFFF);

  static const secondary = Color(0xFFF1ECF6);
  static const secondaryFg = Color(0xFF463355);

  static const accent = Color(0xFFEADCF0);
  static const accentFg = Color(0xFF513A66);

  static const card = Color(0xFFFFFFFF);
  static const border = Color(0xFFEAE4ED);

  static const rosa = Color(0xFFE07AA1);
  static const rosaLight = Color(0xFFF9E1EA);

  static const lilas = Color(0xFFB394D6);
  static const lilasLight = Color(0xFFEFE6F7);

  static const roxo = Color(0xFF7A3FAE);
  static const roxoLight = Color(0xFFEEE2F4);

  static const magenta = Color(0xFFD43F9D);

  static const fertile = Color(0xFF48B36A);
  static const fertileLight = Color(0xFFE0F2E6);

  static const ovulation = Color(0xFFE2A33D);
  static const ovulationLight = Color(0xFFF6E9D2);

  static const destructive = Color(0xFFE0413A);

  static const headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x33CC3DA6), rosaLight, lilasLight],
  );
}

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(useMaterial3: true);
    final textTheme = GoogleFonts.nunitoTextTheme(base.textTheme).apply(
      bodyColor: AppColors.foreground,
      displayColor: AppColors.foreground,
    );

    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryFg,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryFg,
      surface: AppColors.card,
      onSurface: AppColors.foreground,
      error: AppColors.destructive,
    );

    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.foreground,
        titleTextStyle: GoogleFonts.nunito(
          color: AppColors.foreground,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.border, thickness: 1),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.roxo,
        textColor: AppColors.foreground,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.card,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStatePropertyAll(
          GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 11),
        ),
        iconTheme: const WidgetStatePropertyAll(
          IconThemeData(color: AppColors.mutedForeground),
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.roxo),
    );
  }
}
