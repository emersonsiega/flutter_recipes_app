import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  factory Category({
    required String id,
    required String name,
    required String description,
    required Uri imageUrl,
  }) = _Category;
}
