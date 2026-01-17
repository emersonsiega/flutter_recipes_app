import 'package:dart_either/dart_either.dart';
import 'package:flutter_recipes_app/src/domain/entities/category.dart';
import 'package:flutter_recipes_app/src/domain/entities/recipe.dart';
import 'package:flutter_recipes_app/src/domain/failures/async_operation_failure.dart';

/// Abstract repository interface for recipe-related operations.
abstract class IRecipeRepository {
  /// Lists all available recipe categories.
  Future<Either<AsyncOperationFailure, List<Category>>> getCategories();

  /// Searches for recipes by name.
  Future<Either<AsyncOperationFailure, List<Recipe>>> searchRecipesByName(String name);

  /// Lists recipes from a specific category.
  Future<Either<AsyncOperationFailure, List<RecipeSummary>>> getRecipesByCategory(Category category);

  /// Retrieves detailed information for a recipe by its ID.
  Future<Either<AsyncOperationFailure, DetailedRecipe>> getRecipeById(String id);
}
