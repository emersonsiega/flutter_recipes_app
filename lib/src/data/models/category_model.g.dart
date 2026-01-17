// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      idCategory: json['idCategory'] as String,
      strCategory: json['strCategory'] as String,
      strCategoryDescription: json['strCategoryDescription'] as String,
      strCategoryThumb: json['strCategoryThumb'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryDescription': instance.strCategoryDescription,
      'strCategoryThumb': instance.strCategoryThumb,
    };
