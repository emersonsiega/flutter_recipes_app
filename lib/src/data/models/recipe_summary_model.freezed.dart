// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeSummaryModel {
  String get idMeal;
  String get strMeal;
  String get strMealThumb;

  /// Create a copy of RecipeSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipeSummaryModelCopyWith<RecipeSummaryModel> get copyWith =>
      _$RecipeSummaryModelCopyWithImpl<RecipeSummaryModel>(
        this as RecipeSummaryModel,
        _$identity,
      );

  /// Serializes this RecipeSummaryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecipeSummaryModel &&
            (identical(other.idMeal, idMeal) || other.idMeal == idMeal) &&
            (identical(other.strMeal, strMeal) || other.strMeal == strMeal) &&
            (identical(other.strMealThumb, strMealThumb) ||
                other.strMealThumb == strMealThumb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idMeal, strMeal, strMealThumb);

  @override
  String toString() {
    return 'RecipeSummaryModel(idMeal: $idMeal, strMeal: $strMeal, strMealThumb: $strMealThumb)';
  }
}

/// @nodoc
abstract mixin class $RecipeSummaryModelCopyWith<$Res> {
  factory $RecipeSummaryModelCopyWith(
    RecipeSummaryModel value,
    $Res Function(RecipeSummaryModel) _then,
  ) = _$RecipeSummaryModelCopyWithImpl;
  @useResult
  $Res call({String idMeal, String strMeal, String strMealThumb});
}

/// @nodoc
class _$RecipeSummaryModelCopyWithImpl<$Res>
    implements $RecipeSummaryModelCopyWith<$Res> {
  _$RecipeSummaryModelCopyWithImpl(this._self, this._then);

  final RecipeSummaryModel _self;
  final $Res Function(RecipeSummaryModel) _then;

  /// Create a copy of RecipeSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMeal = null,
    Object? strMeal = null,
    Object? strMealThumb = null,
  }) {
    return _then(
      _self.copyWith(
        idMeal: null == idMeal
            ? _self.idMeal
            : idMeal // ignore: cast_nullable_to_non_nullable
                  as String,
        strMeal: null == strMeal
            ? _self.strMeal
            : strMeal // ignore: cast_nullable_to_non_nullable
                  as String,
        strMealThumb: null == strMealThumb
            ? _self.strMealThumb
            : strMealThumb // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _RecipeSummaryModel implements RecipeSummaryModel {
  const _RecipeSummaryModel({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });
  factory _RecipeSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeSummaryModelFromJson(json);

  @override
  final String idMeal;
  @override
  final String strMeal;
  @override
  final String strMealThumb;

  /// Create a copy of RecipeSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecipeSummaryModelCopyWith<_RecipeSummaryModel> get copyWith =>
      __$RecipeSummaryModelCopyWithImpl<_RecipeSummaryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecipeSummaryModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeSummaryModel &&
            (identical(other.idMeal, idMeal) || other.idMeal == idMeal) &&
            (identical(other.strMeal, strMeal) || other.strMeal == strMeal) &&
            (identical(other.strMealThumb, strMealThumb) ||
                other.strMealThumb == strMealThumb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idMeal, strMeal, strMealThumb);

  @override
  String toString() {
    return 'RecipeSummaryModel(idMeal: $idMeal, strMeal: $strMeal, strMealThumb: $strMealThumb)';
  }
}

/// @nodoc
abstract mixin class _$RecipeSummaryModelCopyWith<$Res>
    implements $RecipeSummaryModelCopyWith<$Res> {
  factory _$RecipeSummaryModelCopyWith(
    _RecipeSummaryModel value,
    $Res Function(_RecipeSummaryModel) _then,
  ) = __$RecipeSummaryModelCopyWithImpl;
  @override
  @useResult
  $Res call({String idMeal, String strMeal, String strMealThumb});
}

/// @nodoc
class __$RecipeSummaryModelCopyWithImpl<$Res>
    implements _$RecipeSummaryModelCopyWith<$Res> {
  __$RecipeSummaryModelCopyWithImpl(this._self, this._then);

  final _RecipeSummaryModel _self;
  final $Res Function(_RecipeSummaryModel) _then;

  /// Create a copy of RecipeSummaryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idMeal = null,
    Object? strMeal = null,
    Object? strMealThumb = null,
  }) {
    return _then(
      _RecipeSummaryModel(
        idMeal: null == idMeal
            ? _self.idMeal
            : idMeal // ignore: cast_nullable_to_non_nullable
                  as String,
        strMeal: null == strMeal
            ? _self.strMeal
            : strMeal // ignore: cast_nullable_to_non_nullable
                  as String,
        strMealThumb: null == strMealThumb
            ? _self.strMealThumb
            : strMealThumb // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
