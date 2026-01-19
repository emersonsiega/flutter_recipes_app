import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AsyncData<List<Category>>(data: [])) AsyncData<List<Category>> categories,
    @Default(AsyncData<List<Recipe>>(data: [])) AsyncData<List<Recipe>> suggestions,
  }) = _HomeState;
}

@freezed
abstract class AsyncData<T> with _$AsyncData<T> {
  const factory AsyncData({
    required T data,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _AsyncData;
}
