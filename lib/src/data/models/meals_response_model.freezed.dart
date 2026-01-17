// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meals_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealsResponseModel {
  @JsonKey(name: 'meals')
  List<dynamic> get meals;

  /// Create a copy of MealsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MealsResponseModelCopyWith<MealsResponseModel> get copyWith =>
      _$MealsResponseModelCopyWithImpl<MealsResponseModel>(
        this as MealsResponseModel,
        _$identity,
      );

  /// Serializes this MealsResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MealsResponseModel &&
            const DeepCollectionEquality().equals(other.meals, meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(meals));

  @override
  String toString() {
    return 'MealsResponseModel(meals: $meals)';
  }
}

/// @nodoc
abstract mixin class $MealsResponseModelCopyWith<$Res> {
  factory $MealsResponseModelCopyWith(
    MealsResponseModel value,
    $Res Function(MealsResponseModel) _then,
  ) = _$MealsResponseModelCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'meals') List<dynamic> meals});
}

/// @nodoc
class _$MealsResponseModelCopyWithImpl<$Res>
    implements $MealsResponseModelCopyWith<$Res> {
  _$MealsResponseModelCopyWithImpl(this._self, this._then);

  final MealsResponseModel _self;
  final $Res Function(MealsResponseModel) _then;

  /// Create a copy of MealsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meals = null}) {
    return _then(
      _self.copyWith(
        meals: null == meals
            ? _self.meals
            : meals // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _MealsResponseModel implements MealsResponseModel {
  const _MealsResponseModel({
    @JsonKey(name: 'meals') final List<dynamic> meals = const [],
  }) : _meals = meals;
  factory _MealsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MealsResponseModelFromJson(json);

  final List<dynamic> _meals;
  @override
  @JsonKey(name: 'meals')
  List<dynamic> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  /// Create a copy of MealsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MealsResponseModelCopyWith<_MealsResponseModel> get copyWith =>
      __$MealsResponseModelCopyWithImpl<_MealsResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MealsResponseModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MealsResponseModel &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_meals));

  @override
  String toString() {
    return 'MealsResponseModel(meals: $meals)';
  }
}

/// @nodoc
abstract mixin class _$MealsResponseModelCopyWith<$Res>
    implements $MealsResponseModelCopyWith<$Res> {
  factory _$MealsResponseModelCopyWith(
    _MealsResponseModel value,
    $Res Function(_MealsResponseModel) _then,
  ) = __$MealsResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'meals') List<dynamic> meals});
}

/// @nodoc
class __$MealsResponseModelCopyWithImpl<$Res>
    implements _$MealsResponseModelCopyWith<$Res> {
  __$MealsResponseModelCopyWithImpl(this._self, this._then);

  final _MealsResponseModel _self;
  final $Res Function(_MealsResponseModel) _then;

  /// Create a copy of MealsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? meals = null}) {
    return _then(
      _MealsResponseModel(
        meals: null == meals
            ? _self._meals
            : meals // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
      ),
    );
  }
}
