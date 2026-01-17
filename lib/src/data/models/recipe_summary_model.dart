import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_summary_model.freezed.dart';
part 'recipe_summary_model.g.dart';

/// Model representing a recipe summary.
///
/// Used for search and filter endpoints that return minimal recipe information.
@freezed
abstract class RecipeSummaryModel with _$RecipeSummaryModel {
  const factory RecipeSummaryModel({
    required String idMeal,
    required String strMeal,
    required String strMealThumb,
  }) = _RecipeSummaryModel;

  factory RecipeSummaryModel.fromJson(Map<String, dynamic> json) => _$RecipeSummaryModelFromJson(json);
}

/// Extension to convert [RecipeSummaryModel] to [Recipe.summary] entity.
extension RecipeSummaryModelExtension on RecipeSummaryModel {
  RecipeSummary toEntity() {
    return Recipe.summary(
      id: idMeal,
      name: strMeal,
      thumbnail: Uri.parse(strMealThumb),
    ) as RecipeSummary;
  }
}
