import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  return ThemeData(
    fontFamily: 'Inter',
    colorScheme: colorScheme,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: colorScheme.onSurface.withValues(alpha: 0.5),
      hintStyle: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.5)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.onSurface.withValues(alpha: 0.2), width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.onSurface.withValues(alpha: 0.2), width: 0.5),
      ),
    ),
  );
}
