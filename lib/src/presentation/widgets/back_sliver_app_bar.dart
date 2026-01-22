import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';

class BackSliverAppBar extends StatelessWidget {
  final VoidCallback? onBack;

  const BackSliverAppBar({
    super.key,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 2,
      forceElevated: true,
      floating: true,
      surfaceTintColor: context.colorScheme.surface,
      shadowColor: context.colorScheme.shadow,
      automaticallyImplyLeading: false,
      leadingWidth: double.infinity,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          onPressed: onBack ?? () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back, size: 20),
          label: Text(
            t.actions.backToHome,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(context.colorScheme.primary),
            foregroundColor: WidgetStateProperty.all(context.colorScheme.primary),
            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
    );
  }
}

