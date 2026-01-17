import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  factory Category({
    String? id,
    required String name,
    String? description,
    Uri? imageUrl,
  }) = _Category;
}
