import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/cached_image.dart';

class RecipeImage extends StatelessWidget {
  final Recipe recipe;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius borderRadius;
  final BorderRadius sourceBorderRadius;
  final BorderRadius destinationBorderRadius;

  const RecipeImage({
    super.key,
    required this.recipe,
    this.width,
    this.height,
    this.fit,
    BorderRadius? borderRadius,
    BorderRadius? sourceBorderRadius,
    BorderRadius? destinationBorderRadius,
  }) : borderRadius = borderRadius ?? const .all(.circular(8.0)),
       sourceBorderRadius = sourceBorderRadius ?? const .all(.circular(8.0)),
       destinationBorderRadius = destinationBorderRadius ?? const .all(.circular(8.0));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedImage(
        key: ValueKey(recipe.id),
        imageUrl: recipe.thumbnail.toString(),
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
