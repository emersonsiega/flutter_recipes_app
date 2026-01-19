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
  AsyncData<List<Category>> get categories;
  AsyncData<List<Recipe>> get suggestions;

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipesScreenStateCopyWith<RecipesScreenState> get copyWith =>
      _$RecipesScreenStateCopyWithImpl<RecipesScreenState>(
        this as RecipesScreenState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecipesScreenState &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.suggestions, suggestions) ||
                other.suggestions == suggestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categories, suggestions);

  @override
  String toString() {
    return 'RecipesScreenState(categories: $categories, suggestions: $suggestions)';
  }
}

/// @nodoc
abstract mixin class $RecipesScreenStateCopyWith<$Res> {
  factory $RecipesScreenStateCopyWith(
    RecipesScreenState value,
    $Res Function(RecipesScreenState) _then,
  ) = _$RecipesScreenStateCopyWithImpl;
  @useResult
  $Res call({
    AsyncData<List<Category>> categories,
    AsyncData<List<Recipe>> suggestions,
  });

  $AsyncDataCopyWith<List<Category>, $Res> get categories;
  $AsyncDataCopyWith<List<Recipe>, $Res> get suggestions;
}

/// @nodoc
class _$RecipesScreenStateCopyWithImpl<$Res>
    implements $RecipesScreenStateCopyWith<$Res> {
  _$RecipesScreenStateCopyWithImpl(this._self, this._then);

  final RecipesScreenState _self;
  final $Res Function(RecipesScreenState) _then;

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null, Object? suggestions = null}) {
    return _then(
      _self.copyWith(
        categories: null == categories
            ? _self.categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as AsyncData<List<Category>>,
        suggestions: null == suggestions
            ? _self.suggestions
            : suggestions // ignore: cast_nullable_to_non_nullable
                  as AsyncData<List<Recipe>>,
      ),
    );
  }

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncDataCopyWith<List<Category>, $Res> get categories {
    return $AsyncDataCopyWith<List<Category>, $Res>(_self.categories, (value) {
      return _then(_self.copyWith(categories: value));
    });
  }

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncDataCopyWith<List<Recipe>, $Res> get suggestions {
    return $AsyncDataCopyWith<List<Recipe>, $Res>(_self.suggestions, (value) {
      return _then(_self.copyWith(suggestions: value));
    });
  }
}

/// @nodoc

class _RecipesScreenState implements RecipesScreenState {
  const _RecipesScreenState({
    this.categories = const AsyncData<List<Category>>(data: []),
    this.suggestions = const AsyncData<List<Recipe>>(data: []),
  });

  @override
  @JsonKey()
  final AsyncData<List<Category>> categories;
  @override
  @JsonKey()
  final AsyncData<List<Recipe>> suggestions;

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecipesScreenStateCopyWith<_RecipesScreenState> get copyWith =>
      __$RecipesScreenStateCopyWithImpl<_RecipesScreenState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipesScreenState &&
            (identical(other.categories, categories) ||
                other.categories == categories) &&
            (identical(other.suggestions, suggestions) ||
                other.suggestions == suggestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categories, suggestions);

  @override
  String toString() {
    return 'RecipesScreenState(categories: $categories, suggestions: $suggestions)';
  }
}

/// @nodoc
abstract mixin class _$RecipesScreenStateCopyWith<$Res>
    implements $RecipesScreenStateCopyWith<$Res> {
  factory _$RecipesScreenStateCopyWith(
    _RecipesScreenState value,
    $Res Function(_RecipesScreenState) _then,
  ) = __$RecipesScreenStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    AsyncData<List<Category>> categories,
    AsyncData<List<Recipe>> suggestions,
  });

  @override
  $AsyncDataCopyWith<List<Category>, $Res> get categories;
  @override
  $AsyncDataCopyWith<List<Recipe>, $Res> get suggestions;
}

/// @nodoc
class __$RecipesScreenStateCopyWithImpl<$Res>
    implements _$RecipesScreenStateCopyWith<$Res> {
  __$RecipesScreenStateCopyWithImpl(this._self, this._then);

  final _RecipesScreenState _self;
  final $Res Function(_RecipesScreenState) _then;

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? categories = null, Object? suggestions = null}) {
    return _then(
      _RecipesScreenState(
        categories: null == categories
            ? _self.categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as AsyncData<List<Category>>,
        suggestions: null == suggestions
            ? _self.suggestions
            : suggestions // ignore: cast_nullable_to_non_nullable
                  as AsyncData<List<Recipe>>,
      ),
    );
  }

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncDataCopyWith<List<Category>, $Res> get categories {
    return $AsyncDataCopyWith<List<Category>, $Res>(_self.categories, (value) {
      return _then(_self.copyWith(categories: value));
    });
  }

  /// Create a copy of RecipesScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncDataCopyWith<List<Recipe>, $Res> get suggestions {
    return $AsyncDataCopyWith<List<Recipe>, $Res>(_self.suggestions, (value) {
      return _then(_self.copyWith(suggestions: value));
    });
  }
}

/// @nodoc
mixin _$AsyncData<T> {
  T get data;
  bool get isLoading;
  bool get hasError;

  /// Create a copy of AsyncData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AsyncDataCopyWith<T, AsyncData<T>> get copyWith =>
      _$AsyncDataCopyWithImpl<T, AsyncData<T>>(
        this as AsyncData<T>,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AsyncData<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    isLoading,
    hasError,
  );

  @override
  String toString() {
    return 'AsyncData<$T>(data: $data, isLoading: $isLoading, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class $AsyncDataCopyWith<T, $Res> {
  factory $AsyncDataCopyWith(
    AsyncData<T> value,
    $Res Function(AsyncData<T>) _then,
  ) = _$AsyncDataCopyWithImpl;
  @useResult
  $Res call({T data, bool isLoading, bool hasError});
}

/// @nodoc
class _$AsyncDataCopyWithImpl<T, $Res> implements $AsyncDataCopyWith<T, $Res> {
  _$AsyncDataCopyWithImpl(this._self, this._then);

  final AsyncData<T> _self;
  final $Res Function(AsyncData<T>) _then;

  /// Create a copy of AsyncData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _self.copyWith(
        data: freezed == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
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

class _AsyncData<T> implements AsyncData<T> {
  const _AsyncData({
    required this.data,
    this.isLoading = false,
    this.hasError = false,
  });

  @override
  final T data;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;

  /// Create a copy of AsyncData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AsyncDataCopyWith<T, _AsyncData<T>> get copyWith =>
      __$AsyncDataCopyWithImpl<T, _AsyncData<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AsyncData<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    isLoading,
    hasError,
  );

  @override
  String toString() {
    return 'AsyncData<$T>(data: $data, isLoading: $isLoading, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class _$AsyncDataCopyWith<T, $Res>
    implements $AsyncDataCopyWith<T, $Res> {
  factory _$AsyncDataCopyWith(
    _AsyncData<T> value,
    $Res Function(_AsyncData<T>) _then,
  ) = __$AsyncDataCopyWithImpl;
  @override
  @useResult
  $Res call({T data, bool isLoading, bool hasError});
}

/// @nodoc
class __$AsyncDataCopyWithImpl<T, $Res>
    implements _$AsyncDataCopyWith<T, $Res> {
  __$AsyncDataCopyWithImpl(this._self, this._then);

  final _AsyncData<T> _self;
  final $Res Function(_AsyncData<T>) _then;

  /// Create a copy of AsyncData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(
      _AsyncData<T>(
        data: freezed == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T,
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
