import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/viewmodel/viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/views/category/category_screen_state.dart';

class CategoryViewModel extends ViewModel<CategoryState> {
  final IRecipeRepository _recipeRepository;

  CategoryViewModel(this._recipeRepository) : super(const CategoryState(recipes: [], isLoading: true, hasError: false));

  /// Fetches the recipes for the category screen
  Future<void> fetchRecipes(Category? category, String name) async {
    emit(state.copyWith(isLoading: true, hasError: false));

    final result = await _recipeRepository.getRecipesByCategory(category ?? Category(name: name));

    emit(
      result.fold(
        ifLeft: (_) => state.copyWith(hasError: true, isLoading: false),
        ifRight: (data) => state.copyWith(isLoading: false, recipes: data),
      ),
    );
  }
}
