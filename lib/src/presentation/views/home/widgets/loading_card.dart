import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/custom_progress_indicator.dart';

class LoadingCard extends StatelessWidget {
  final String description;
  const LoadingCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Row(
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          spacing: 8,
          children: [
            Text(
              description,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: .6),
              ),
            ),
            CustomProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
