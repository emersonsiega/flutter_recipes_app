import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_details_screen_state.freezed.dart';

@freezed
abstract class RecipeDetailsState with _$RecipeDetailsState {
  const factory RecipeDetailsState({
    DetailedRecipe? recipe,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _RecipeDetailsState;
}
