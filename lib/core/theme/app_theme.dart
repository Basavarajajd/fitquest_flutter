import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF050505);
  static const Color cardColor = Color(0xFF111111);
  static const Color primaryGreen = Color(0xFF00E95C);
  static const Color secondary = Color(0xFF1B1B1B);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primaryColor: primaryGreen,

    colorScheme: const ColorScheme.dark(
      primary: primaryGreen,
      surface: cardColor,
    ),

    cardColor: cardColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
    ),
  );
}
