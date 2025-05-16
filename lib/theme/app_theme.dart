import 'package:flutter/material.dart';

final Color primaryColor = const Color(0xFFFFC107); // Dourado vibrante
final Color secondaryColor = const Color(
  0xFFB71C1C,
); // Vermelho escuro (detalhe forte)
final Color backgroundColor = const Color(0xFF000000); // Preto absoluto
final Color textColor = const Color(0xFFFFFFFF); // Branco puro
final Color accentGray = const Color(0xFFB0BEC5); // Cinza metálico sutil

final ThemeData appTheme = ThemeData(
  fontFamily: 'Prompt',
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: backgroundColor,
    secondary: secondaryColor,
    onSecondary: Colors.white,
    surface: backgroundColor,
    onSurface: textColor,
    error: Colors.red,
    onError: Colors.white,
    tertiary: accentGray,
  ),
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: backgroundColor,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      side: BorderSide(color: primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: primaryColor),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: textColor),
    bodyMedium: TextStyle(fontSize: 14, color: textColor),
  ),
);
