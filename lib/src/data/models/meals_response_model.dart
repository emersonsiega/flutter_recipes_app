import 'package:freezed_annotation/freezed_annotation.dart';
import 'detailed_recipe_model.dart';
import 'recipe_summary_model.dart';

part 'meals_response_model.freezed.dart';
part 'meals_response_model.g.dart';

/// Model representing the API response for meals endpoints (search, filter, lookup).
///
/// The `meals` field can be null when no results are found.
@freezed
abstract class MealsResponseModel with _$MealsResponseModel {
  const factory MealsResponseModel({
    @Default([]) @JsonKey(name: 'meals') List<dynamic> meals,
  }) = _MealsResponseModel;

  factory MealsResponseModel.fromJson(Map<String, dynamic> json) => _$MealsResponseModelFromJson(json);
}

/// Extension with helper methods for [MealsResponseModel].
extension MealsResponseModelExtension on MealsResponseModel {
  /// Converts meals to list of [RecipeSummaryModel].
  List<RecipeSummaryModel> toRecipeSummaryList() {
    return meals.map((json) => RecipeSummaryModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  /// Converts meals to list of [DetailedRecipeModel].
  List<DetailedRecipeModel> toDetailedRecipeList() {
    return meals.map((json) => DetailedRecipeModel.fromJson(json as Map<String, dynamic>)).toList();
  }
}
