import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';
import 'package:flutter_recipes_app/src/presentation/navigation/navigation.dart';
import 'package:flutter_recipes_app/src/presentation/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: t.appTitle,
      theme: buildTheme(),
    );
  }
}
