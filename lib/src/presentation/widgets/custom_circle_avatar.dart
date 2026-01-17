import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String text;
  
  const CustomCircleAvatar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colorScheme.primary,
      foregroundColor: context.colorScheme.onPrimary,
      child: Text(text.toUpperCase()),
    );
  }
}
