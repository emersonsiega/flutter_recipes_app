import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/recipes_screen_state.dart';

class RecipesScreenViewModel extends ChangeNotifier {
  RecipesScreenViewModel();

  RecipesScreenState _state = const RecipesScreenState.idle();
  RecipesScreenState get state => _state;

  // Example: fetched categories, can be replaced with real data fetching logic
  Future<void> fetchCategories() async {
    _state = const RecipesScreenState.loading();
    notifyListeners();

    // Replace with actual fetching logic
    await Future.delayed(const Duration(seconds: 1));
    final exampleCategories = <Category>[];
    _state = RecipesScreenState.success(categories: exampleCategories);
    notifyListeners();
  }

  // Search recipes (dummy logic, should be replaced with real implementation)
  Future<void> searchRecipes(String query) async {
    if (state case SuccessState(:final copyWith)) {
      _state = copyWith(query: query, searching: true);
      notifyListeners();

      // Simulate an API call
      await Future.delayed(const Duration(seconds: 1));


      final exampleResults = <RecipeSummary>[];
      _state = copyWith(query: query, queryResult: exampleResults, searching: false);
      notifyListeners();
    }
  }

  void reset() {
    if (state case SuccessState(:final copyWith, :final query) when query.isNotEmpty) {
      _state = copyWith(query: '', queryResult: [], searching: false);
      notifyListeners();
    }
  }
}
