import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData(
    fontFamily: 'Inter',
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}
