// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {
  String get idCategory;
  String get strCategory;
  String get strCategoryDescription;
  String get strCategoryThumb;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      _$CategoryModelCopyWithImpl<CategoryModel>(
        this as CategoryModel,
        _$identity,
      );

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryModel &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strCategoryDescription, strCategoryDescription) ||
                other.strCategoryDescription == strCategoryDescription) &&
            (identical(other.strCategoryThumb, strCategoryThumb) ||
                other.strCategoryThumb == strCategoryThumb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    idCategory,
    strCategory,
    strCategoryDescription,
    strCategoryThumb,
  );

  @override
  String toString() {
    return 'CategoryModel(idCategory: $idCategory, strCategory: $strCategory, strCategoryDescription: $strCategoryDescription, strCategoryThumb: $strCategoryThumb)';
  }
}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
    CategoryModel value,
    $Res Function(CategoryModel) _then,
  ) = _$CategoryModelCopyWithImpl;
  @useResult
  $Res call({
    String idCategory,
    String strCategory,
    String strCategoryDescription,
    String strCategoryThumb,
  });
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryDescription = null,
    Object? strCategoryThumb = null,
  }) {
    return _then(
      _self.copyWith(
        idCategory: null == idCategory
            ? _self.idCategory
            : idCategory // ignore: cast_nullable_to_non_nullable
                  as String,
        strCategory: null == strCategory
            ? _self.strCategory
            : strCategory // ignore: cast_nullable_to_non_nullable
                  as String,
        strCategoryDescription: null == strCategoryDescription
            ? _self.strCategoryDescription
            : strCategoryDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        strCategoryThumb: null == strCategoryThumb
            ? _self.strCategoryThumb
            : strCategoryThumb // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryModel implements CategoryModel {
  const _CategoryModel({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryDescription,
    required this.strCategoryThumb,
  });
  factory _CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  final String idCategory;
  @override
  final String strCategory;
  @override
  final String strCategoryDescription;
  @override
  final String strCategoryThumb;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryModel &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strCategoryDescription, strCategoryDescription) ||
                other.strCategoryDescription == strCategoryDescription) &&
            (identical(other.strCategoryThumb, strCategoryThumb) ||
                other.strCategoryThumb == strCategoryThumb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    idCategory,
    strCategory,
    strCategoryDescription,
    strCategoryThumb,
  );

  @override
  String toString() {
    return 'CategoryModel(idCategory: $idCategory, strCategory: $strCategory, strCategoryDescription: $strCategoryDescription, strCategoryThumb: $strCategoryThumb)';
  }
}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(
    _CategoryModel value,
    $Res Function(_CategoryModel) _then,
  ) = __$CategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String idCategory,
    String strCategory,
    String strCategoryDescription,
    String strCategoryThumb,
  });
}

/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryDescription = null,
    Object? strCategoryThumb = null,
  }) {
    return _then(
      _CategoryModel(
        idCategory: null == idCategory
            ? _self.idCategory
            : idCategory // ignore: cast_nullable_to_non_nullable
                  as String,
        strCategory: null == strCategory
            ? _self.strCategory
            : strCategory // ignore: cast_nullable_to_non_nullable
                  as String,
        strCategoryDescription: null == strCategoryDescription
            ? _self.strCategoryDescription
            : strCategoryDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        strCategoryThumb: null == strCategoryThumb
            ? _self.strCategoryThumb
            : strCategoryThumb // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
