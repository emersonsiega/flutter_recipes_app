import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/viewmodel/viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_details/recipe_details_screen_state.dart';

class RecipeDetailsViewController extends ViewModel<RecipeDetailsState> {
  final IRecipeRepository _recipeRepository;

  RecipeDetailsViewController(this._recipeRepository)
    : super(const RecipeDetailsState(isLoading: true, hasError: false));

  /// Fetches the recipe details for the recipe details screen
  Future<void> fetchRecipeDetail(Recipe recipe) async {
    emit(state.copyWith(isLoading: true, hasError: false));

    final result = await _recipeRepository.getRecipeById(recipe.id);

    emit(
      result.fold(
        ifLeft: (_) => state.copyWith(hasError: true, isLoading: false),
        ifRight: (data) => state.copyWith(isLoading: false, recipe: data),
      ),
    );
  }
}
