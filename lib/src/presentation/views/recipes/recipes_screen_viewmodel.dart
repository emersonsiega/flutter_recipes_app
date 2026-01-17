import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/recipes_screen_state.dart';

class RecipesScreenViewModel extends ChangeNotifier {
  final IRecipeRepository _recipeRepository;
  RecipesScreenViewModel(this._recipeRepository);

  RecipesScreenState _state = const RecipesScreenState.idle();
  RecipesScreenState get state => _state;

  /// Fetches all available recipe categories
  Future<void> fetchCategories() async {
    _state = const RecipesScreenState.loading();
    notifyListeners();

    final result = await _recipeRepository.getCategories();
    _state = result.fold(
      ifLeft: (_) => ErrorState(),
      ifRight: (categories) => SuccessState(categories: categories),
    );
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
