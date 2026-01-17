import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  return ThemeData(
    fontFamily: 'Inter',
    colorScheme: colorScheme,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.primary,
      prefixIconColor: colorScheme.onPrimary.withValues(alpha: 0.8),
      hintStyle: TextStyle(color: colorScheme.onPrimary.withValues(alpha: 0.8)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}
