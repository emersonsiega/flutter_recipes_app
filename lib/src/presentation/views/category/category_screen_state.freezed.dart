// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryState {
  List<Recipe> get recipes;
  bool get isLoading;
  bool get hasError;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      _$CategoryStateCopyWithImpl<CategoryState>(
        this as CategoryState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryState &&
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
    return 'CategoryState(recipes: $recipes, isLoading: $isLoading, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
    CategoryState value,
    $Res Function(CategoryState) _then,
  ) = _$CategoryStateCopyWithImpl;
  @useResult
  $Res call({List<Recipe> recipes, bool isLoading, bool hasError});
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._self, this._then);

  final CategoryState _self;
  final $Res Function(CategoryState) _then;

  /// Create a copy of CategoryState
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

class _CategoryState implements CategoryState {
  const _CategoryState({
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

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryStateCopyWith<_CategoryState> get copyWith =>
      __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryState &&
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
    return 'CategoryState(recipes: $recipes, isLoading: $isLoading, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class _$CategoryStateCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(
    _CategoryState value,
    $Res Function(_CategoryState) _then,
  ) = __$CategoryStateCopyWithImpl;
  @override
  @useResult
  $Res call({List<Recipe> recipes, bool isLoading, bool hasError});
}

/// @nodoc
class __$CategoryStateCopyWithImpl<$Res>
    implements _$CategoryStateCopyWith<$Res> {
  __$CategoryStateCopyWithImpl(this._self, this._then);

  final _CategoryState _self;
  final $Res Function(_CategoryState) _then;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recipes = null,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _CategoryState(
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
