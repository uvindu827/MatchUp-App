import 'package:flutter/material.dart';

class AppConstants {
  // Brand Name
  static const String appName = 'MATCH-UP';
  static const String poweredBy = 'POWERED BY AQUACORE';
  static const String AppTitle = 'MatchUp';

  // logo
  static const String LogoPath = 'assets/logo/3-removebg-preview (1).png';

  // Primary Colors (from your splash screen)
  static const Color primaryText = Color(
    0xff404b5c,
  ); // Dark blue-gray for "MATCH-UP"
  static const Color accentOrange = Color(
    0xffff7a00,
  ); // Orange for "AQUACORE" and accents
  static const Color background = Colors.white; // Splash background

  // Full Color Palette (add more as needed)
  static const Color primary = Color(0xff404b5c);
  static const Color secondary = Color(0xffff7a00);
  static const Color surface = Colors.white;
  static const Color error = Colors.red;
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;
  static const Color onBackground = Color(0xff404b5c);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppConstants.primary,
    scaffoldBackgroundColor: AppConstants.background,
    colorScheme: ColorScheme.light(
      primary: AppConstants.primary,
      secondary: AppConstants.secondary,
      surface: AppConstants.surface,
      error: AppConstants.error,
      onPrimary: AppConstants.onPrimary,
      onSecondary: AppConstants.onSecondary,
      onSurface: AppConstants.onBackground,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppConstants.primaryText,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppConstants.accentOrange,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  // Add darkTheme later if needed
}

class bottomNav_bar {
  static const String name1 = 'Umpire';
  static const String name2 = 'Home';
  static const String name3 = 'Score';
  static const String name4 = 'Settings';

  static const IconData icon1 = Icons.person;
  static const IconData icon2 = Icons.home;
  static const IconData icon3 = Icons.bar_chart;
  static const IconData icon4 = Icons.settings;

  static const Color selectedColor = Color(0xffff7a00);
  static const Color unseletedColor = Colors.grey;
}
