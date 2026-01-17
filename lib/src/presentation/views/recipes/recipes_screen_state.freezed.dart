// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipes_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipesScreenState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RecipesScreenState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RecipesScreenState()';
  }
}

/// @nodoc
class $RecipesScreenStateCopyWith<$Res> {
  $RecipesScreenStateCopyWith(
    RecipesScreenState _,
    $Res Function(RecipesScreenState) __,
  );
}

/// @nodoc

class IdleState extends RecipesScreenState {
  const IdleState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IdleState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RecipesScreenState.idle()';
  }
}

/// @nodoc

class LoadingState extends RecipesScreenState {
  const LoadingState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RecipesScreenState.loading()';
  }
}

/// @nodoc

class SuccessState extends RecipesScreenState {
  const SuccessState({
    final List<Category> categories = const [],
    this.searching = false,
    this.query = '',
    final List<RecipeSummary> queryResult = const [],
  }) : _categories = categories,
       _queryResult = queryResult,
       super._();

  final List<Category> _categories;
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @JsonKey()
  final bool searching;
  @JsonKey()
  final String query;
  final List<RecipeSummary> _queryResult;
  @JsonKey()
  List<RecipeSummary> get queryResult {
    if (_queryResult is EqualUnmodifiableListView) return _queryResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queryResult);
  }

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessStateCopyWith<SuccessState> get copyWith =>
      _$SuccessStateCopyWithImpl<SuccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessState &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.searching, searching) ||
                other.searching == searching) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(
              other._queryResult,
              _queryResult,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
    searching,
    query,
    const DeepCollectionEquality().hash(_queryResult),
  );

  @override
  String toString() {
    return 'RecipesScreenState.success(categories: $categories, searching: $searching, query: $query, queryResult: $queryResult)';
  }
}

/// @nodoc
abstract mixin class $SuccessStateCopyWith<$Res>
    implements $RecipesScreenStateCopyWith<$Res> {
  factory $SuccessStateCopyWith(
    SuccessState value,
    $Res Function(SuccessState) _then,
  ) = _$SuccessStateCopyWithImpl;
  @useResult
  $Res call({
    List<Category> categories,
    bool searching,
    String query,
    List<RecipeSummary> queryResult,
  });
}

/// @nodoc
class _$SuccessStateCopyWithImpl<$Res> implements $SuccessStateCopyWith<$Res> {
  _$SuccessStateCopyWithImpl(this._self, this._then);

  final SuccessState _self;
  final $Res Function(SuccessState) _then;

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
    Object? searching = null,
    Object? query = null,
    Object? queryResult = null,
  }) {
    return _then(
      SuccessState(
        categories: null == categories
            ? _self._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<Category>,
        searching: null == searching
            ? _self.searching
            : searching // ignore: cast_nullable_to_non_nullable
                  as bool,
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        queryResult: null == queryResult
            ? _self._queryResult
            : queryResult // ignore: cast_nullable_to_non_nullable
                  as List<RecipeSummary>,
      ),
    );
  }
}

/// @nodoc

class ErrorState extends RecipesScreenState {
  const ErrorState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RecipesScreenState.error()';
  }
}
