import 'package:dart_either/dart_either.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';

/// Use case to fetch unique recipe suggestions by calling the repository's
/// random recipe endpoint until the desired number of unique recipes are collected.
class FetchRecipeSuggestions {
  final IRecipeRepository _repository;

  const FetchRecipeSuggestions(this._repository);

  /// Fetches unique recipe suggestions by repeatedly calling the repository's
  /// random recipe endpoint until the desired number of different recipes are found.
  ///
  /// [recipeCount] - The number of unique recipes to fetch (defaults to 3).
  ///
  /// Returns [Either] containing a list of unique [DetailedRecipe] instances.
  /// If an error occurs during the operation, returns a [Failure].
  /// Otherwise, returns whatever recipes were successfully collected (even if less than [recipeCount]).
  Future<Either<Failure, List<DetailedRecipe>>> call({int recipeCount = 3}) async {
    final uniqueRecipes = <DetailedRecipe>[];
    final seenIds = <String>{};
    final maxAttempts = recipeCount * 2; // Maximum attempts is 2 times the recipe count
    int attempts = 0;

    while (uniqueRecipes.length < recipeCount && attempts < maxAttempts) {
      attempts++;

      final result = await _repository.getRandomRecipe();

      Failure? failure;
      result.fold(
        ifLeft: (f) => failure = f,
        ifRight: (recipe) {
          if (!seenIds.contains(recipe.id)) {
            seenIds.add(recipe.id);
            uniqueRecipes.add(recipe);
          }
        },
      );

      // If we got a failure, return it immediately
      if (failure != null) return Left(failure!);
    }

    return Right(uniqueRecipes);
  }
}
