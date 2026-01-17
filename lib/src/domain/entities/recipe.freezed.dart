// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recipe {
  String get id;
  String get name;
  Uri get thumbnail;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<Recipe> get copyWith =>
      _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Recipe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, thumbnail);

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, thumbnail: $thumbnail)';
  }
}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) =
      _$RecipeCopyWithImpl;
  @useResult
  $Res call({String id, String name, Uri thumbnail});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res> implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? thumbnail = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnail: null == thumbnail
            ? _self.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as Uri,
      ),
    );
  }
}

/// @nodoc

class RecipeSummary extends Recipe {
  const RecipeSummary({
    required this.id,
    required this.name,
    required this.thumbnail,
  }) : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final Uri thumbnail;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipeSummaryCopyWith<RecipeSummary> get copyWith =>
      _$RecipeSummaryCopyWithImpl<RecipeSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecipeSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, thumbnail);

  @override
  String toString() {
    return 'Recipe.summary(id: $id, name: $name, thumbnail: $thumbnail)';
  }
}

/// @nodoc
abstract mixin class $RecipeSummaryCopyWith<$Res>
    implements $RecipeCopyWith<$Res> {
  factory $RecipeSummaryCopyWith(
    RecipeSummary value,
    $Res Function(RecipeSummary) _then,
  ) = _$RecipeSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, Uri thumbnail});
}

/// @nodoc
class _$RecipeSummaryCopyWithImpl<$Res>
    implements $RecipeSummaryCopyWith<$Res> {
  _$RecipeSummaryCopyWithImpl(this._self, this._then);

  final RecipeSummary _self;
  final $Res Function(RecipeSummary) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? thumbnail = null,
  }) {
    return _then(
      RecipeSummary(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnail: null == thumbnail
            ? _self.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as Uri,
      ),
    );
  }
}

/// @nodoc

class DetailedRecipe extends Recipe {
  const DetailedRecipe({
    required this.id,
    required this.name,
    required this.thumbnail,
    this.area,
    required final List<Ingredient> ingredients,
    required final List<String> instructions,
    required this.category,
    final List<String> tags = const [],
    this.video,
  }) : _ingredients = ingredients,
       _instructions = instructions,
       _tags = tags,
       super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final Uri thumbnail;
  final String? area;
  final List<Ingredient> _ingredients;
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<String> _instructions;
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  final Category category;
  final List<String> _tags;
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final Uri? video;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailedRecipeCopyWith<DetailedRecipe> get copyWith =>
      _$DetailedRecipeCopyWithImpl<DetailedRecipe>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailedRecipe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.area, area) || other.area == area) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            const DeepCollectionEquality().equals(
              other._instructions,
              _instructions,
            ) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.video, video) || other.video == video));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    thumbnail,
    area,
    const DeepCollectionEquality().hash(_ingredients),
    const DeepCollectionEquality().hash(_instructions),
    category,
    const DeepCollectionEquality().hash(_tags),
    video,
  );

  @override
  String toString() {
    return 'Recipe.detailed(id: $id, name: $name, thumbnail: $thumbnail, area: $area, ingredients: $ingredients, instructions: $instructions, category: $category, tags: $tags, video: $video)';
  }
}

/// @nodoc
abstract mixin class $DetailedRecipeCopyWith<$Res>
    implements $RecipeCopyWith<$Res> {
  factory $DetailedRecipeCopyWith(
    DetailedRecipe value,
    $Res Function(DetailedRecipe) _then,
  ) = _$DetailedRecipeCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    Uri thumbnail,
    String? area,
    List<Ingredient> ingredients,
    List<String> instructions,
    Category category,
    List<String> tags,
    Uri? video,
  });

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$DetailedRecipeCopyWithImpl<$Res>
    implements $DetailedRecipeCopyWith<$Res> {
  _$DetailedRecipeCopyWithImpl(this._self, this._then);

  final DetailedRecipe _self;
  final $Res Function(DetailedRecipe) _then;

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? thumbnail = null,
    Object? area = freezed,
    Object? ingredients = null,
    Object? instructions = null,
    Object? category = null,
    Object? tags = null,
    Object? video = freezed,
  }) {
    return _then(
      DetailedRecipe(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnail: null == thumbnail
            ? _self.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as Uri,
        area: freezed == area
            ? _self.area
            : area // ignore: cast_nullable_to_non_nullable
                  as String?,
        ingredients: null == ingredients
            ? _self._ingredients
            : ingredients // ignore: cast_nullable_to_non_nullable
                  as List<Ingredient>,
        instructions: null == instructions
            ? _self._instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        category: null == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as Category,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        video: freezed == video
            ? _self.video
            : video // ignore: cast_nullable_to_non_nullable
                  as Uri?,
      ),
    );
  }

  /// Create a copy of Recipe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}
