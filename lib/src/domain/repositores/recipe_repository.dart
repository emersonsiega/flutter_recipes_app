import 'package:dart_either/dart_either.dart';
import 'package:flutter_recipes_app/src/domain/entities/category.dart';
import 'package:flutter_recipes_app/src/domain/entities/recipe.dart';
import 'package:flutter_recipes_app/src/domain/failures/failures.dart';

/// Abstract repository interface for recipe-related operations.
abstract class IRecipeRepository {
  /// Lists all available recipe categories.
  Future<Either<Failure, List<Category>>> getCategories();

  /// Searches for recipes by name.
  Future<Either<Failure, List<DetailedRecipe>>> searchRecipesByName(String name);

  /// Lists recipes from a specific category.
  Future<Either<Failure, List<RecipeSummary>>> getRecipesByCategory(Category category);

  /// Retrieves detailed information for a recipe by its ID.
  Future<Either<Failure, DetailedRecipe>> getRecipeById(String id);

  /// Fetches a single random recipe.
  Future<Either<Failure, DetailedRecipe>> getRandomRecipe();
}
