import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/views/home/home_screen_state.dart';

class HomeViewController extends ChangeNotifier {
  final IRecipeRepository _recipeRepository;
  final FetchRecipeSuggestions _fetchRecipeSuggestions;

  HomeViewController(
    this._recipeRepository,
    this._fetchRecipeSuggestions,
  );

  HomeState _state = const HomeState(
    categories: AsyncData(data: [], isLoading: true),
    suggestions: AsyncData(data: [], isLoading: true),
  );
  HomeState get state => _state;

  /// Fetches all data for the home screen
  Future<void> fetchData() async {
    await Future.wait([fetchCategories(), fetchSuggestions()]);
  }

  /// Fetches the categories for the home screen
  Future<void> fetchCategories() async {
    _state = _state.copyWith(categories: _state.categories.copyWith(isLoading: true, hasError: false));
    notifyListeners();

    final result = await _recipeRepository.getCategories();

    final newState = result.fold(
      ifLeft: (_) => _state.categories.copyWith(hasError: true, isLoading: false),
      ifRight: (data) => _state.categories.copyWith(isLoading: false, data: data),
    );
    _state = _state.copyWith(categories: newState);
    notifyListeners();
  }

  /// Fetches the suggestions for the home screen
  Future<void> fetchSuggestions() async {
    _state = _state.copyWith(suggestions: _state.suggestions.copyWith(isLoading: true, hasError: false));
    notifyListeners();

    final result = await _fetchRecipeSuggestions();

    final newState = result.fold(
      ifLeft: (_) => _state.suggestions.copyWith(hasError: true, isLoading: false),
      ifRight: (data) => _state.suggestions.copyWith(data: data, isLoading: false),
    );
    _state = _state.copyWith(suggestions: newState);
    notifyListeners();
  }
}
