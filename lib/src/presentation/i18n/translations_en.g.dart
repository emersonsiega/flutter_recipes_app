///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsEn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override String get appTitle => 'Recipes App';
	@override late final _TranslationsFailuresEn failures = _TranslationsFailuresEn._(_root);
	@override late final _TranslationsErrorMessageBoxEn errorMessageBox = _TranslationsErrorMessageBoxEn._(_root);
	@override late final _TranslationsRecipesEn recipes = _TranslationsRecipesEn._(_root);
	@override String difficultyLevel({required DifficultyLevel difficulty}) {
		switch (difficulty) {
			case DifficultyLevel.easy:
				return 'Easy';
			case DifficultyLevel.medium:
				return 'Medium';
			case DifficultyLevel.hard:
				return 'Hard';
		}
	}
}

// Path: failures
class _TranslationsFailuresEn implements TranslationsFailuresPtBr {
	_TranslationsFailuresEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get generic => 'An unexpected error occurred while loading the data. Please try again.';
}

// Path: errorMessageBox
class _TranslationsErrorMessageBoxEn implements TranslationsErrorMessageBoxPtBr {
	_TranslationsErrorMessageBoxEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get retry => 'Try again';
}

// Path: recipes
class _TranslationsRecipesEn implements TranslationsRecipesPtBr {
	_TranslationsRecipesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recipe Finder';
	@override String get searchPlaceholder => 'Search for recipes...';
	@override String get categories => 'Categories';
	@override String get noCategoriesFound => 'No categories found';
	@override String get suggestions => 'Suggestions';
	@override String get noSuggestionsFound => 'No suggestions found';
	@override String get loadingSuggestions => 'Loading suggestions...';
	@override String get loadingCategories => 'Loading categories...';
	@override String get errorLoadingSuggestions => 'It was not possible to load the suggestions. Please try again.';
	@override String get errorLoadingCategories => 'It was not possible to load the categories. Please try again.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => 'Recipes App',
			'failures.generic' => 'An unexpected error occurred while loading the data. Please try again.',
			'errorMessageBox.retry' => 'Try again',
			'recipes.title' => 'Recipe Finder',
			'recipes.searchPlaceholder' => 'Search for recipes...',
			'recipes.categories' => 'Categories',
			'recipes.noCategoriesFound' => 'No categories found',
			'recipes.suggestions' => 'Suggestions',
			'recipes.noSuggestionsFound' => 'No suggestions found',
			'recipes.loadingSuggestions' => 'Loading suggestions...',
			'recipes.loadingCategories' => 'Loading categories...',
			'recipes.errorLoadingSuggestions' => 'It was not possible to load the suggestions. Please try again.',
			'recipes.errorLoadingCategories' => 'It was not possible to load the categories. Please try again.',
			'difficultyLevel' => ({required DifficultyLevel difficulty}) { switch (difficulty) { case DifficultyLevel.easy: return 'Easy'; case DifficultyLevel.medium: return 'Medium'; case DifficultyLevel.hard: return 'Hard'; } }, 
			_ => null,
		};
	}
}
