// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesResponseModel _$CategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => _CategoriesResponseModel(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoriesResponseModelToJson(
  _CategoriesResponseModel instance,
) => <String, dynamic>{'categories': instance.categories};
