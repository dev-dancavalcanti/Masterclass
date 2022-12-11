import 'package:flutter/material.dart';

class TypeMode {
  static ThemeMode theme = ThemeMode.dark;

  static themeToogle() {
    if (theme == ThemeMode.dark) {
      theme = ThemeMode.light;
    } else {
      theme = ThemeMode.dark;
    }
  }
}

class LightTheme {
  static final theme = ThemeData(
      iconTheme: const IconThemeData(color: Colors.white),
      primaryColor: const Color(0xFF055AA3),
      highlightColor: const Color(0xFF172026),
      scaffoldBackgroundColor: const Color(0xFFD6DFE4),
      cardColor: const Color(0xFFEDF4F8),
      brightness: Brightness.light,
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Poppins Semi Bold',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF172026),
          ),
          headline2: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF172026),
          ),
          bodyText1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF51565A)),
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF172026),
          )));
}

class DarkTheme {
  static final theme = ThemeData(
      iconTheme: const IconThemeData(color: Colors.black),
      primaryColor: const Color(0xFF055AA3),
      highlightColor: const Color(0xFFEDF4F8),
      scaffoldBackgroundColor: const Color(0xFF121517),
      cardColor: const Color(0xFF172026),
      brightness: Brightness.dark,
      textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Poppins Semi Bold',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFEDF4F8)),
          headline2: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFFEDF4F8)),
          bodyText1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF51565A)),
          bodyText2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFEDF4F8))));
}
