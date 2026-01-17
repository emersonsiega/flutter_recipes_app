import 'package:dart_either/dart_either.dart';
import 'package:flutter_recipes_app/src/data/datasources/datasources.dart';
import 'package:flutter_recipes_app/src/data/mixins/http_exception_handler_mixin.dart';
import 'package:flutter_recipes_app/src/data/models/models.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';

/// Implementation of [IRecipeRepository] using [IRecipeRemoteDatasource].
class RecipeRepository with HttpExceptionHandlerMixin implements IRecipeRepository {
  final IRecipeRemoteDatasource remoteDatasource;

  const RecipeRepository({required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    return await handleHttpExceptions(
      operation: 'getCategories',
      action: () async {
        final response = await remoteDatasource.getCategories();
        return response.categories.map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, List<DetailedRecipe>>> searchRecipesByName(String name) async {
    return await handleHttpExceptions(
      operation: 'searchRecipesByName',
      action: () async {
        final response = await remoteDatasource.searchRecipesByName(name);
        return response.toDetailedRecipeList().map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, List<RecipeSummary>>> getRecipesByCategory(Category category) async {
    return await handleHttpExceptions(
      operation: 'getRecipesByCategory',
      action: () async {
        final response = await remoteDatasource.getRecipesByCategory(category.name);
        return response.toRecipeSummaryList().map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, DetailedRecipe>> getRecipeById(String id) async {
    return await handleHttpExceptions(
      operation: 'getRecipeById',
      action: () async {
        final recipeModel = await remoteDatasource.getRecipeById(id);
        return recipeModel.toEntity();
      },
    );
  }
}
