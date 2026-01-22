import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/viewmodel/viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_search/recipe_search_screen_state.dart';

class RecipeSearchScreenViewModel extends ViewModel<RecipeSearchState> {
  final IRecipeRepository _recipeRepository;

  RecipeSearchScreenViewModel(this._recipeRepository)
    : super(const RecipeSearchState(recipes: [], isLoading: true, hasError: false));

  /// Searches for recipes by name
  Future<void> searchRecipesByName(String name) async {
    emit(state.copyWith(isLoading: true, hasError: false));

    final result = await _recipeRepository.searchRecipesByName(name);

    emit(
      result.fold(
        ifLeft: (_) => state.copyWith(hasError: true, isLoading: false),
        ifRight: (data) => state.copyWith(isLoading: false, recipes: data),
      ),
    );
  }
}
