import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/viewmodel/viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/views/home/home_screen_state.dart';

class HomeViewController extends ViewModel<HomeState> {
  final IRecipeRepository _recipeRepository;
  final FetchRecipeSuggestions _fetchRecipeSuggestions;

  HomeViewController(
    this._recipeRepository,
    this._fetchRecipeSuggestions,
  ) : super(
        const HomeState(
          categories: AsyncData(data: [], isLoading: true),
          suggestions: AsyncData(data: [], isLoading: true),
        ),
      );

  /// Fetches all data for the home screen
  Future<void> fetchData() async {
    await Future.wait([fetchCategories(), fetchSuggestions()]);
  }

  /// Fetches the categories for the home screen
  Future<void> fetchCategories() async {
    emit(state.copyWith(categories: state.categories.copyWith(isLoading: true, hasError: false)));

    final result = await _recipeRepository.getCategories();

    emit(
      state.copyWith(
        categories: result.fold(
          ifLeft: (_) => state.categories.copyWith(hasError: true, isLoading: false),
          ifRight: (data) => state.categories.copyWith(isLoading: false, data: data),
        ),
      ),
    );
  }

  /// Fetches the suggestions for the home screen
  Future<void> fetchSuggestions() async {
    emit(state.copyWith(suggestions: state.suggestions.copyWith(isLoading: true, hasError: false)));

    final result = await _fetchRecipeSuggestions();

    emit(
      state.copyWith(
        suggestions: result.fold(
          ifLeft: (_) => state.suggestions.copyWith(hasError: true, isLoading: false),
          ifRight: (data) => state.suggestions.copyWith(data: data, isLoading: false),
        ),
      ),
    );
  }
}
