import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_recipe_model.freezed.dart';
part 'detailed_recipe_model.g.dart';

/// Model representing a detailed recipe from TheMealDB API response.
///
/// Used for lookup endpoint that returns full recipe information.
@freezed
abstract class DetailedRecipeModel with _$DetailedRecipeModel {
  const factory DetailedRecipeModel({
    required String idMeal,
    required String strMeal,
    String? strDrinkAlternate,
    required String strCategory,
    String? strArea,
    String? strInstructions,
    required String strMealThumb,
    String? strTags,
    String? strYoutube,
    @JsonKey(name: 'strIngredient1') String? strIngredient1,
    @JsonKey(name: 'strIngredient2') String? strIngredient2,
    @JsonKey(name: 'strIngredient3') String? strIngredient3,
    @JsonKey(name: 'strIngredient4') String? strIngredient4,
    @JsonKey(name: 'strIngredient5') String? strIngredient5,
    @JsonKey(name: 'strIngredient6') String? strIngredient6,
    @JsonKey(name: 'strIngredient7') String? strIngredient7,
    @JsonKey(name: 'strIngredient8') String? strIngredient8,
    @JsonKey(name: 'strIngredient9') String? strIngredient9,
    @JsonKey(name: 'strIngredient10') String? strIngredient10,
    @JsonKey(name: 'strIngredient11') String? strIngredient11,
    @JsonKey(name: 'strIngredient12') String? strIngredient12,
    @JsonKey(name: 'strIngredient13') String? strIngredient13,
    @JsonKey(name: 'strIngredient14') String? strIngredient14,
    @JsonKey(name: 'strIngredient15') String? strIngredient15,
    @JsonKey(name: 'strIngredient16') String? strIngredient16,
    @JsonKey(name: 'strIngredient17') String? strIngredient17,
    @JsonKey(name: 'strIngredient18') String? strIngredient18,
    @JsonKey(name: 'strIngredient19') String? strIngredient19,
    @JsonKey(name: 'strIngredient20') String? strIngredient20,
    @JsonKey(name: 'strMeasure1') String? strMeasure1,
    @JsonKey(name: 'strMeasure2') String? strMeasure2,
    @JsonKey(name: 'strMeasure3') String? strMeasure3,
    @JsonKey(name: 'strMeasure4') String? strMeasure4,
    @JsonKey(name: 'strMeasure5') String? strMeasure5,
    @JsonKey(name: 'strMeasure6') String? strMeasure6,
    @JsonKey(name: 'strMeasure7') String? strMeasure7,
    @JsonKey(name: 'strMeasure8') String? strMeasure8,
    @JsonKey(name: 'strMeasure9') String? strMeasure9,
    @JsonKey(name: 'strMeasure10') String? strMeasure10,
    @JsonKey(name: 'strMeasure11') String? strMeasure11,
    @JsonKey(name: 'strMeasure12') String? strMeasure12,
    @JsonKey(name: 'strMeasure13') String? strMeasure13,
    @JsonKey(name: 'strMeasure14') String? strMeasure14,
    @JsonKey(name: 'strMeasure15') String? strMeasure15,
    @JsonKey(name: 'strMeasure16') String? strMeasure16,
    @JsonKey(name: 'strMeasure17') String? strMeasure17,
    @JsonKey(name: 'strMeasure18') String? strMeasure18,
    @JsonKey(name: 'strMeasure19') String? strMeasure19,
    @JsonKey(name: 'strMeasure20') String? strMeasure20,
  }) = _DetailedRecipeModel;

  factory DetailedRecipeModel.fromJson(Map<String, dynamic> json) => _$DetailedRecipeModelFromJson(json);
}

/// Extension to convert DetailedRecipeModel to Recipe.detailed entity.
extension DetailedRecipeModelExtension on DetailedRecipeModel {
  DetailedRecipe toEntity() {
    final category = Category(name: strCategory);

    // Build ingredients list from strIngredient1-20 and strMeasure1-20
    final ingredients = <Ingredient>[];
    final ingredientFields = [
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strIngredient6,
      strIngredient7,
      strIngredient8,
      strIngredient9,
      strIngredient10,
      strIngredient11,
      strIngredient12,
      strIngredient13,
      strIngredient14,
      strIngredient15,
      strIngredient16,
      strIngredient17,
      strIngredient18,
      strIngredient19,
      strIngredient20,
    ];
    final measureFields = [
      strMeasure1,
      strMeasure2,
      strMeasure3,
      strMeasure4,
      strMeasure5,
      strMeasure6,
      strMeasure7,
      strMeasure8,
      strMeasure9,
      strMeasure10,
      strMeasure11,
      strMeasure12,
      strMeasure13,
      strMeasure14,
      strMeasure15,
      strMeasure16,
      strMeasure17,
      strMeasure18,
      strMeasure19,
      strMeasure20,
    ];

    for (int i = 0; i < ingredientFields.length; i++) {
      final ingredient = ingredientFields[i];
      if (ingredient != null && ingredient.trim().isNotEmpty) {
        ingredients.add(
          Ingredient(
            name: ingredient.trim(),
            measure: measureFields[i]?.trim() ?? '',
          ),
        );
      }
    }

    // Parse instructions - split by newlines or periods and filter empty
    final instructions = (strInstructions ?? '')
        .split(RegExp(r'\n+|(?<=\.)\s+'))
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    // Parse tags - split by comma
    final tags = (strTags ?? '').split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();

    return Recipe.detailed(
          id: idMeal,
          name: strMeal,
          thumbnail: Uri.parse(strMealThumb),
          area: strArea,
          ingredients: ingredients,
          instructions: instructions.isEmpty ? [strInstructions ?? ''] : instructions,
          category: category,
          tags: tags,
          video: strYoutube != null && strYoutube!.isNotEmpty ? Uri.tryParse(strYoutube!) : null,
        )
        as DetailedRecipe;
  }
}
