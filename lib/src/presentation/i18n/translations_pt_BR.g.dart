///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsPtBr = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// pt-BR: 'Receitas App'
	String get appTitle => 'Receitas App';

	late final TranslationsFailuresPtBr failures = TranslationsFailuresPtBr._(_root);
	late final TranslationsErrorMessageBoxPtBr errorMessageBox = TranslationsErrorMessageBoxPtBr._(_root);
	late final TranslationsRecipesPtBr recipes = TranslationsRecipesPtBr._(_root);

	/// pt-BR: '(easy) {Fácil} (medium) {Média} (hard) {Difícil}'
	String difficultyLevel({required DifficultyLevel difficulty}) {
		switch (difficulty) {
			case DifficultyLevel.easy:
				return 'Fácil';
			case DifficultyLevel.medium:
				return 'Média';
			case DifficultyLevel.hard:
				return 'Difícil';
		}
	}
}

// Path: failures
class TranslationsFailuresPtBr {
	TranslationsFailuresPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Ocorreu um erro inesperado ao carregar os dados. Por favor, tente novamente.'
	String get generic => 'Ocorreu um erro inesperado ao carregar os dados. Por favor, tente novamente.';
}

// Path: errorMessageBox
class TranslationsErrorMessageBoxPtBr {
	TranslationsErrorMessageBoxPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Tentar novamente'
	String get retry => 'Tentar novamente';
}

// Path: recipes
class TranslationsRecipesPtBr {
	TranslationsRecipesPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Buscador de receitas'
	String get title => 'Buscador de receitas';

	/// pt-BR: 'Pesquisar receitas...'
	String get searchPlaceholder => 'Pesquisar receitas...';

	/// pt-BR: 'Categorias'
	String get categories => 'Categorias';

	/// pt-BR: 'Nenhuma categoria encontrada'
	String get noCategoriesFound => 'Nenhuma categoria encontrada';

	/// pt-BR: 'Sugestões'
	String get suggestions => 'Sugestões';

	/// pt-BR: 'Nenhuma sugestão encontrada'
	String get noSuggestionsFound => 'Nenhuma sugestão encontrada';

	/// pt-BR: 'Carregando sugestões...'
	String get loadingSuggestions => 'Carregando sugestões...';

	/// pt-BR: 'Carregando categorias...'
	String get loadingCategories => 'Carregando categorias...';

	/// pt-BR: 'Não foi possível carregar as sugestões. Por favor, tente novamente.'
	String get errorLoadingSuggestions => 'Não foi possível carregar as sugestões. Por favor, tente novamente.';

	/// pt-BR: 'Não foi possível carregar as categorias. Por favor, tente novamente.'
	String get errorLoadingCategories => 'Não foi possível carregar as categorias. Por favor, tente novamente.';
}

/// The flat map containing all translations for locale <pt-BR>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => 'Receitas App',
			'failures.generic' => 'Ocorreu um erro inesperado ao carregar os dados. Por favor, tente novamente.',
			'errorMessageBox.retry' => 'Tentar novamente',
			'recipes.title' => 'Buscador de receitas',
			'recipes.searchPlaceholder' => 'Pesquisar receitas...',
			'recipes.categories' => 'Categorias',
			'recipes.noCategoriesFound' => 'Nenhuma categoria encontrada',
			'recipes.suggestions' => 'Sugestões',
			'recipes.noSuggestionsFound' => 'Nenhuma sugestão encontrada',
			'recipes.loadingSuggestions' => 'Carregando sugestões...',
			'recipes.loadingCategories' => 'Carregando categorias...',
			'recipes.errorLoadingSuggestions' => 'Não foi possível carregar as sugestões. Por favor, tente novamente.',
			'recipes.errorLoadingCategories' => 'Não foi possível carregar as categorias. Por favor, tente novamente.',
			'difficultyLevel' => ({required DifficultyLevel difficulty}) { switch (difficulty) { case DifficultyLevel.easy: return 'Fácil'; case DifficultyLevel.medium: return 'Média'; case DifficultyLevel.hard: return 'Difícil'; } }, 
			_ => null,
		};
	}
}
