import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';

class ErrorMessageBox extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;
  final String? retryLabel;
  const ErrorMessageBox({super.key, this.message, this.onRetry, this.retryLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.errorContainer,
        border: Border.all(color: context.colorScheme.error, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: .min,
        spacing: 8,
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Row(
            spacing: 16,
            children: [
              Icon(Icons.error, color: context.colorScheme.error, size: 36),
              Expanded(child: Text(message ?? t.failures.generic)),
            ],
          ),
          if (onRetry != null)
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Align(
                alignment: .centerRight,
                child: FilledButton(
                  onPressed: onRetry,
                  child: Text(retryLabel ?? t.errorMessageBox.retry),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
