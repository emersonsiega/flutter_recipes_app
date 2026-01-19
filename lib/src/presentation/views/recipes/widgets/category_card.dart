import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/widgets.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Navigate to the category recipes screen
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
              Expanded(
                child: CachedImage(
                  imageUrl: category.imageUrl?.toString(),
                  fit: .cover,
                ),
              ),
              Container(
                color: context.colorScheme.surface,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: .bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
