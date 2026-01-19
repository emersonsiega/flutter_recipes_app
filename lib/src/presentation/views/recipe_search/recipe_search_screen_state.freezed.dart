// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_search_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeSearchState {
  List<Recipe> get recipes;
  bool get isLoading;
  bool get hasError;

  /// Create a copy of RecipeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipeSearchStateCopyWith<RecipeSearchState> get copyWith =>
      _$RecipeSearchStateCopyWithImpl<RecipeSearchState>(
        this as RecipeSearchState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecipeSearchState &&
            const DeepCollectionEquality().equals(other.recipes, recipes) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(recipes),
    isLoading,
    hasError,
  );

  @override
  String toString() {
    return 'RecipeSearchState(recipes: $recipes, isLoading: $isLoading, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class $RecipeSearchStateCopyWith<$Res> {
  factory $RecipeSearchStateCopyWith(
    RecipeSearchState value,
    $Res Function(RecipeSearchState) _then,
  ) = _$RecipeSearchStateCopyWithImpl;
  @useResult
  $Res call({List<Recipe> recipes, bool isLoading, bool hasError});
}

/// @nodoc
class _$RecipeSearchStateCopyWithImpl<$Res>
    implements $RecipeSearchStateCopyWith<$Res> {
  _$RecipeSearchStateCopyWithImpl(this._self, this._then);

  final RecipeSearchState _self;
  final $Res Function(RecipeSearchState) _then;

  /// Create a copy of RecipeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _self.copyWith(
        recipes: null == recipes
            ? _self.recipes
            : recipes // ignore: cast_nullable_to_non_nullable
                  as List<Recipe>,
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

class _RecipeSearchState implements RecipeSearchState {
  const _RecipeSearchState({
    final List<Recipe> recipes = const [],
    this.isLoading = false,
    this.hasError = false,
  }) : _recipes = recipes;

  final List<Recipe> _recipes;
  @override
  @JsonKey()
  List<Recipe> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;

  /// Create a copy of RecipeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecipeSearchStateCopyWith<_RecipeSearchState> get copyWith =>
      __$RecipeSearchStateCopyWithImpl<_RecipeSearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeSearchState &&
            const DeepCollectionEquality().equals(other._recipes, _recipes) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_recipes),
    isLoading,
    hasError,
  );

  @override
  String toString() {
    return 'RecipeSearchState(recipes: $recipes, isLoading: $isLoading, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class _$RecipeSearchStateCopyWith<$Res>
    implements $RecipeSearchStateCopyWith<$Res> {
  factory _$RecipeSearchStateCopyWith(
    _RecipeSearchState value,
    $Res Function(_RecipeSearchState) _then,
  ) = __$RecipeSearchStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Recipe> recipes, bool isLoading, bool hasError});
}

/// @nodoc
class __$RecipeSearchStateCopyWithImpl<$Res>
    implements _$RecipeSearchStateCopyWith<$Res> {
  __$RecipeSearchStateCopyWithImpl(this._self, this._then);

  final _RecipeSearchState _self;
  final $Res Function(_RecipeSearchState) _then;

  /// Create a copy of RecipeSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recipes = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _RecipeSearchState(
        recipes: null == recipes
            ? _self._recipes
            : recipes // ignore: cast_nullable_to_non_nullable
                  as List<Recipe>,
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
