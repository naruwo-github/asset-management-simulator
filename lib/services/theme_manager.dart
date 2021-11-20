import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: Colors.orange,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.orange,
        foregroundColor: Colors.white,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: Colors.orange,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        color: Colors.orange,
        foregroundColor: Colors.white,
      ),
    );
  }
}