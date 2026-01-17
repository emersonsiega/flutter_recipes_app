import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipes_screen_state.freezed.dart';

@freezed
sealed class RecipesScreenState with _$RecipesScreenState {
  const RecipesScreenState._();

  const factory RecipesScreenState.idle() = IdleState;

  const factory RecipesScreenState.loading() = LoadingState;

  const factory RecipesScreenState.success({
    @Default([]) List<Category> categories,
    @Default(false) bool searching,
    @Default('') String query,
    @Default([]) List<RecipeSummary> queryResult,
  }) = SuccessState;

  const factory RecipesScreenState.error() = ErrorState;
}
