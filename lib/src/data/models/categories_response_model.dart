import 'category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_response_model.freezed.dart';
part 'categories_response_model.g.dart';

/// Model representing the API response for categories endpoint.
@freezed
abstract class CategoriesResponseModel with _$CategoriesResponseModel {
  const factory CategoriesResponseModel({
    required List<CategoryModel> categories,
  }) = _CategoriesResponseModel;

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => _$CategoriesResponseModelFromJson(json);
}
