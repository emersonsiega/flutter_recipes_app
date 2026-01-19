import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_screen_state.freezed.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _CategoryState;
}
