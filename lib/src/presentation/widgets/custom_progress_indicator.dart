import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double size;
  const CustomProgressIndicator({super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(context.colorScheme.secondary),
        strokeWidth: 1.5,
      ),
    );
  }
}
