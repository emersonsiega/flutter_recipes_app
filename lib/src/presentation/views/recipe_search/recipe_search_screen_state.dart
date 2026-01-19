import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_search_screen_state.freezed.dart';

@freezed
abstract class RecipeSearchState with _$RecipeSearchState {
  const factory RecipeSearchState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _RecipeSearchState;
}
