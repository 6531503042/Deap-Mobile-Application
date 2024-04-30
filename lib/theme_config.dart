import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey.shade50,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6750a4),
      onPrimary: Color(0xFFffffff),
      primaryContainer: Color(0xFFe9ddff),
      onPrimaryContainer: Color(0xFF22005d),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFcfbcff),
      onPrimary: Color(0xFF381e72),
      primaryContainer: Color(0xFF4f378a),
      onPrimaryContainer: Color(0xFFe9ddff),
    ),
  );
}
