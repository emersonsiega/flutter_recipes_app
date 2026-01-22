// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_details_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeDetailsState {
  DetailedRecipe? get recipe;
  bool get isLoading;
  bool get hasError;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipeDetailsStateCopyWith<RecipeDetailsState> get copyWith =>
      _$RecipeDetailsStateCopyWithImpl<RecipeDetailsState>(
        this as RecipeDetailsState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecipeDetailsState &&
            const DeepCollectionEquality().equals(other.recipe, recipe) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(recipe),
    isLoading,
    hasError,
  );

  @override
  String toString() {
    return 'RecipeDetailsState(recipe: $recipe, isLoading: $isLoading, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class $RecipeDetailsStateCopyWith<$Res> {
  factory $RecipeDetailsStateCopyWith(
    RecipeDetailsState value,
    $Res Function(RecipeDetailsState) _then,
  ) = _$RecipeDetailsStateCopyWithImpl;
  @useResult
  $Res call({DetailedRecipe? recipe, bool isLoading, bool hasError});
}

/// @nodoc
class _$RecipeDetailsStateCopyWithImpl<$Res>
    implements $RecipeDetailsStateCopyWith<$Res> {
  _$RecipeDetailsStateCopyWithImpl(this._self, this._then);

  final RecipeDetailsState _self;
  final $Res Function(RecipeDetailsState) _then;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _self.copyWith(
        recipe: freezed == recipe
            ? _self.recipe
            : recipe // ignore: cast_nullable_to_non_nullable
                  as DetailedRecipe?,
        isLoading: null == isLoading
            ? _self.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasError: null == hasError
            ? _self.hasError
            : hasError // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _RecipeDetailsState implements RecipeDetailsState {
  const _RecipeDetailsState({
    this.recipe,
    this.isLoading = false,
    this.hasError = false,
  });

  @override
  final DetailedRecipe? recipe;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecipeDetailsStateCopyWith<_RecipeDetailsState> get copyWith =>
      __$RecipeDetailsStateCopyWithImpl<_RecipeDetailsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeDetailsState &&
            const DeepCollectionEquality().equals(other.recipe, recipe) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(recipe),
    isLoading,
    hasError,
  );

  @override
  String toString() {
    return 'RecipeDetailsState(recipe: $recipe, isLoading: $isLoading, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class _$RecipeDetailsStateCopyWith<$Res>
    implements $RecipeDetailsStateCopyWith<$Res> {
  factory _$RecipeDetailsStateCopyWith(
    _RecipeDetailsState value,
    $Res Function(_RecipeDetailsState) _then,
  ) = __$RecipeDetailsStateCopyWithImpl;
  @override
  @useResult
  $Res call({DetailedRecipe? recipe, bool isLoading, bool hasError});
}

/// @nodoc
class __$RecipeDetailsStateCopyWithImpl<$Res>
    implements _$RecipeDetailsStateCopyWith<$Res> {
  __$RecipeDetailsStateCopyWithImpl(this._self, this._then);

  final _RecipeDetailsState _self;
  final $Res Function(_RecipeDetailsState) _then;

  /// Create a copy of RecipeDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recipe = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _RecipeDetailsState(
        recipe: freezed == recipe
            ? _self.recipe
            : recipe // ignore: cast_nullable_to_non_nullable
                  as DetailedRecipe?,
        isLoading: null == isLoading
            ? _self.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasError: null == hasError
            ? _self.hasError
            : hasError // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
