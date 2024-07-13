import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Light theme colors
  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightAccentColor = Colors.green;
  static const Color _lightTextColor = Colors.black;
  static const Color _lightButtonTextColor = Colors.white;
  static const Color _lightBackgroundColor = Colors.white;

  // Dark theme colors
  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkAccentColor = Colors.yellow;
  static const Color _darkTextColor = Colors.white;
  static const Color _darkButtonTextColor = Colors.black;
  static const Color _darkBackgroundColor = Colors.black;

  // Primary color getter
  static Color get primaryColor => _lightPrimaryColor;

  // Light theme text styles
  static const TextStyle _lightHeadingStyle = TextStyle(
    fontSize: 28,
    color: _lightTextColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _lightSubheadingStyle = TextStyle(
    fontSize: 20,
    color: _lightTextColor,
  );

  static const TextStyle _lightButtonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: _lightButtonTextColor,
  );

  // Dark theme text styles
  static const TextStyle _darkHeadingStyle = TextStyle(
    fontSize: 28,
    color: _lightPrimaryColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle _darkSubheadingStyle = TextStyle(
    fontSize: 20,
    color: _lightTextColor,
  );

  static const TextStyle _darkButtonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: _darkButtonTextColor,
  );

  // Light theme data
  static final ThemeData lightThemeData = ThemeData(
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightBackgroundColor,
    textTheme: const TextTheme(
      displayLarge: _lightHeadingStyle,
      titleLarge: _lightSubheadingStyle,
      labelLarge: _lightButtonTextStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _lightButtonTextColor,
        backgroundColor: _lightAccentColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: _lightButtonTextStyle,
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: _lightAccentColor),
  );

  // Dark theme data
  static final ThemeData darkThemeData = ThemeData(
    primaryColor: _darkPrimaryColor,
    scaffoldBackgroundColor: _darkBackgroundColor,
    textTheme: const TextTheme(
      displayLarge: _darkHeadingStyle,
      titleLarge: _darkSubheadingStyle,
      labelLarge: _darkButtonTextStyle,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: _darkButtonTextColor,
        backgroundColor: _darkAccentColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: _darkButtonTextStyle,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _darkAccentColor),
  );
}
