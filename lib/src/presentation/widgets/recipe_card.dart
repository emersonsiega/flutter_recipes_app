import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/widgets.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Navigate to the recipe screen
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              CachedImage(
                height: 200,
                width: double.infinity,
                imageUrl: recipe.thumbnail.toString(),
                fit: .fitWidth,
              ),
              Container(
                color: context.colorScheme.surface,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: .min,
                  spacing: 8,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      recipe.name,
                      textAlign: .start,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.textTheme.titleMedium?.copyWith(fontWeight: .bold),
                    ),
                    if (recipe case DetailedRecipe(
                      :final area,
                      :final tags,
                      :final difficulty,
                    ) when (area?.isNotEmpty ?? false) && tags.isNotEmpty)
                      Wrap(
                        direction: .horizontal,
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          Text(
                            area!,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurface.withValues(alpha: .6),
                            ),
                          ),
                          if (tags.isNotEmpty)
                            Text(
                              '• ${tags.join(', ')}',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: context.colorScheme.onSurface.withValues(alpha: .6),
                              ),
                            ),
                          Text(
                            '• ${t.difficultyLevel(difficulty: difficulty)}',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurface.withValues(alpha: .6),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
