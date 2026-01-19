import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/views/category/category_screen_state.dart';

class CategoryViewController extends ChangeNotifier {
  final IRecipeRepository _recipeRepository;

  CategoryViewController(this._recipeRepository);

  CategoryState _state = const CategoryState(recipes: [], isLoading: true, hasError: false);
  CategoryState get state => _state;

  /// Fetches the recipes for the category screen
  Future<void> fetchRecipes(Category category) async {
    _state = _state.copyWith(isLoading: true, hasError: false);
    notifyListeners();

    final result = await _recipeRepository.getRecipesByCategory(category);

    _state = result.fold(
      ifLeft: (_) => _state.copyWith(hasError: true, isLoading: false),
      ifRight: (data) => _state.copyWith(isLoading: false, recipes: data),
    );
    notifyListeners();
  }
}
