import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

/// Model representing a category from TheMealDB API response.
@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String idCategory,
    required String strCategory,
    required String strCategoryDescription,
    required String strCategoryThumb,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}

/// Extension to convert CategoryModel to Category entity.
extension CategoryModelExtension on CategoryModel {
  Category toEntity() {
    return Category(
      id: idCategory,
      name: strCategory,
      description: strCategoryDescription,
      imageUrl: Uri.parse(strCategoryThumb),
    );
  }
}
