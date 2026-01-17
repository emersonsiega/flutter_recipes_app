// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ingredient {
  String get name;
  String get measure;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IngredientCopyWith<Ingredient> get copyWith =>
      _$IngredientCopyWithImpl<Ingredient>(this as Ingredient, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Ingredient &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.measure, measure) || other.measure == measure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, measure);

  @override
  String toString() {
    return 'Ingredient(name: $name, measure: $measure)';
  }
}

/// @nodoc
abstract mixin class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
    Ingredient value,
    $Res Function(Ingredient) _then,
  ) = _$IngredientCopyWithImpl;
  @useResult
  $Res call({String name, String measure});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res> implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._self, this._then);

  final Ingredient _self;
  final $Res Function(Ingredient) _then;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? measure = null}) {
    return _then(
      _self.copyWith(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        measure: null == measure
            ? _self.measure
            : measure // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _Ingredient implements Ingredient {
  _Ingredient({required this.name, required this.measure});

  @override
  final String name;
  @override
  final String measure;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Ingredient &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.measure, measure) || other.measure == measure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, measure);

  @override
  String toString() {
    return 'Ingredient(name: $name, measure: $measure)';
  }
}

/// @nodoc
abstract mixin class _$IngredientCopyWith<$Res>
    implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(
    _Ingredient value,
    $Res Function(_Ingredient) _then,
  ) = __$IngredientCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String measure});
}

/// @nodoc
class __$IngredientCopyWithImpl<$Res> implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(this._self, this._then);

  final _Ingredient _self;
  final $Res Function(_Ingredient) _then;

  /// Create a copy of Ingredient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? name = null, Object? measure = null}) {
    return _then(
      _Ingredient(
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        measure: null == measure
            ? _self.measure
            : measure // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
