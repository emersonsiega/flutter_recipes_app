import 'dart:convert';

import 'package:flutter_recipes_app/src/data/models/categories_response_model.dart';
import 'package:flutter_recipes_app/src/data/models/detailed_recipe_model.dart';
import 'package:flutter_recipes_app/src/data/models/meals_response_model.dart';
import 'package:http/http.dart' as http;

/// Abstract datasource for recipe-related remote data operations.
abstract class IRecipeRemoteDatasource {
  /// Fetches all available recipe categories.
  Future<CategoriesResponseModel> getCategories();

  /// Searches for recipes by name.
  Future<MealsResponseModel> searchRecipesByName(String name);

  /// Fetches recipes filtered by category name.
  Future<MealsResponseModel> getRecipesByCategory(String categoryName);

  /// Fetches detailed recipe information by ID.
  Future<DetailedRecipeModel> getRecipeById(String id);

  /// Fetches a single random recipe.
  Future<DetailedRecipeModel> getRandomRecipe();
}

/// Implementation of [IRecipeRemoteDatasource] using TheMealDB API.
class RecipeRemoteDatasource implements IRecipeRemoteDatasource {
  final http.Client httpClient;
  final String baseUrl;

  const RecipeRemoteDatasource({
    required this.httpClient,
    required this.baseUrl,
  });

  @override
  Future<CategoriesResponseModel> getCategories() async {
    final uri = Uri.parse('$baseUrl/categories.php');
    final response = await httpClient.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return CategoriesResponseModel.fromJson(json);
  }

  @override
  Future<MealsResponseModel> searchRecipesByName(String name) async {
    final uri = Uri.parse('$baseUrl/search.php?s=$name');
    final response = await httpClient.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return MealsResponseModel.fromJson(json);
  }

  @override
  Future<MealsResponseModel> getRecipesByCategory(String categoryName) async {
    final uri = Uri.parse('$baseUrl/filter.php?c=$categoryName');
    final response = await httpClient.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return MealsResponseModel.fromJson(json);
  }

  @override
  Future<DetailedRecipeModel> getRecipeById(String id) async {
    final uri = Uri.parse('$baseUrl/lookup.php?i=$id');
    final response = await httpClient.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final mealsResponse = MealsResponseModel.fromJson(json);
    final recipeJson = mealsResponse.meals.first as Map<String, dynamic>;
    return DetailedRecipeModel.fromJson(recipeJson);
  }

  @override
  Future<DetailedRecipeModel> getRandomRecipe() async {
    final uri = Uri.parse('$baseUrl/random.php');
    final response = await httpClient.get(uri);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final mealsResponse = MealsResponseModel.fromJson(json);
    final recipeJson = mealsResponse.meals.first as Map<String, dynamic>;
    return DetailedRecipeModel.fromJson(recipeJson);
  }
}
