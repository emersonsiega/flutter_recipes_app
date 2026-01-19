import 'package:flutter_recipes_app/src/domain/entities/category.dart';
import 'package:flutter_recipes_app/src/domain/entities/ingredient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
sealed class Recipe with _$Recipe {
  const Recipe._();

  /// Represents a recipe with minimal (summary) information.
  const factory Recipe.summary({
    required String id,
    required String name,
    required Uri thumbnail,
  }) = RecipeSummary;

  /// Represents a recipe with detailed information.
  const factory Recipe.detailed({
    required String id,
    required String name,
    required Uri thumbnail,
    String? area,
    required List<Ingredient> ingredients,
    required List<String> instructions,
    required Category category,
    @Default([]) List<String> tags,
    Uri? video,
    required DifficultyLevel difficulty,
  }) = DetailedRecipe;
}

enum DifficultyLevel {
  easy,
  medium,
  hard,
}
