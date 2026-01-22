import 'package:faker/faker.dart';
import 'package:flutter_recipes_app/src/data/data.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';

/// Helper functions for creating test data
extension TestHelpers on Faker {
  /// Creates a [DetailedRecipeModel] with optional parameters.
  /// By default, includes 2 ingredients with measures, instructions, tags, and YouTube URL.
  DetailedRecipeModel createDetailedRecipeModel({
    String? idMeal,
    String? strMeal,
    String? strCategory,
    String? strMealThumb,
    int ingredientCount = 2,
    bool includeInstructions = true,
    bool includeTags = true,
    bool includeYoutube = true,
  }) {
    final ingredients = <String>[];
    final measures = <String>[];
    for (int i = 1; i <= ingredientCount; i++) {
      ingredients.add(lorem.word());
      measures.add(lorem.word());
    }

    return DetailedRecipeModel(
      idMeal: idMeal ?? guid.guid(),
      strMeal: strMeal ?? food.dish(),
      strCategory: strCategory ?? food.cuisine(),
      strMealThumb: strMealThumb ?? internet.httpsUrl(),
      strIngredient1: ingredients.isNotEmpty ? ingredients[0] : null,
      strMeasure1: measures.isNotEmpty ? measures[0] : null,
      strIngredient2: ingredients.length > 1 ? ingredients[1] : null,
      strMeasure2: measures.length > 1 ? measures[1] : null,
      strInstructions: includeInstructions ? lorem.sentence() : null,
      strTags: includeTags ? '${lorem.word()}, ${lorem.word()}' : null,
      strYoutube: includeYoutube ? internet.httpsUrl() : null,
    );
  }

  /// Creates a [Category] entity with optional parameters.
  Category createCategory({
    String? id,
    String? name,
    String? description,
    Uri? imageUrl,
  }) {
    return Category(
      id: id ?? guid.guid(),
      name: name ?? food.cuisine(),
      description: description ?? lorem.sentence(),
      imageUrl: imageUrl ?? Uri.parse(internet.httpsUrl()),
    );
  }

  /// Creates a [CategoryModel] with faker data.
  CategoryModel createCategoryModel() {
    return CategoryModel(
      idCategory: guid.guid(),
      strCategory: food.cuisine(),
      strCategoryDescription: lorem.sentence(),
      strCategoryThumb: internet.httpsUrl(),
    );
  }

  /// Creates a [RecipeSummaryModel] with faker data.
  RecipeSummaryModel createRecipeSummaryModel() {
    return RecipeSummaryModel(
      idMeal: guid.guid(),
      strMeal: food.dish(),
      strMealThumb: internet.httpsUrl(),
    );
  }

  /// Creates a [RecipeSummary] entity with optional parameters.
  RecipeSummary createRecipeSummary({
    String? id,
    String? name,
    Uri? thumbnail,
  }) {
    return Recipe.summary(
          id: id ?? guid.guid(),
          name: name ?? food.dish(),
          thumbnail: thumbnail ?? Uri.parse(internet.httpsUrl()),
        )
        as RecipeSummary;
  }

  String youtubeUrl() {
    return 'https://www.youtube.com/watch?v=${guid.guid().substring(0, 11)}';
  }
}
