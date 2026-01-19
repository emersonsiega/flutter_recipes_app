import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_search/recipe_search_screen_state.dart';

class RecipeSearchScreenViewModel extends ChangeNotifier {
  final IRecipeRepository _recipeRepository;

  RecipeSearchScreenViewModel(this._recipeRepository);

  RecipeSearchState _state = const RecipeSearchState(recipes: [], isLoading: true, hasError: false);
  RecipeSearchState get state => _state;

  /// Searches for recipes by name
  Future<void> searchRecipesByName(String name) async {
    _state = _state.copyWith(isLoading: true, hasError: false);
    notifyListeners();

    final result = await _recipeRepository.searchRecipesByName(name);

    _state = result.fold(
      ifLeft: (_) => _state.copyWith(hasError: true, isLoading: false),
      ifRight: (data) => _state.copyWith(isLoading: false, recipes: data),
    );
    notifyListeners();
  }
}
