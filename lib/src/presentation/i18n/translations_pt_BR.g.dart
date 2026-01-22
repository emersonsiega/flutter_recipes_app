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
	late final TranslationsActionsPtBr actions = TranslationsActionsPtBr._(_root);
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

	late final TranslationsVideoPlayerPtBr videoPlayer = TranslationsVideoPlayerPtBr._(_root);
	late final TranslationsCategoryPtBr category = TranslationsCategoryPtBr._(_root);
	late final TranslationsRecipeSearchPtBr recipeSearch = TranslationsRecipeSearchPtBr._(_root);
	late final TranslationsRecipeDetailsPtBr recipeDetails = TranslationsRecipeDetailsPtBr._(_root);
}

// Path: failures
class TranslationsFailuresPtBr {
	TranslationsFailuresPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Ocorreu um erro inesperado ao carregar os dados. Por favor, tente novamente.'
	String get generic => 'Ocorreu um erro inesperado ao carregar os dados. Por favor, tente novamente.';
}

// Path: actions
class TranslationsActionsPtBr {
	TranslationsActionsPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Voltar ao início'
	String get backToHome => 'Voltar ao início';

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

	/// pt-BR: 'Explorar categorias'
	String get categories => 'Explorar categorias';

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

// Path: videoPlayer
class TranslationsVideoPlayerPtBr {
	TranslationsVideoPlayerPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Não foi possível carregar o vídeo. Por favor, tente novamente.'
	String get errorLoadingVideo => 'Não foi possível carregar o vídeo.\nPor favor, tente novamente.';
}

// Path: category
class TranslationsCategoryPtBr {
	TranslationsCategoryPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: '{categoryName}'
	String title({required Object categoryName}) => '${categoryName}';

	/// pt-BR: '{count} receitas encontradas'
	String recipesCount({required Object count}) => '${count} receitas encontradas';

	/// pt-BR: 'Nenhuma receita encontrada'
	String get noRecipesFound => 'Nenhuma receita encontrada';

	/// pt-BR: 'Não foi possível carregar as receitas. Por favor, tente novamente.'
	String get errorLoadingRecipes => 'Não foi possível carregar as receitas. Por favor, tente novamente.';

	/// pt-BR: 'Carregando receitas...'
	String get loadingRecipes => 'Carregando receitas...';
}

// Path: recipeSearch
class TranslationsRecipeSearchPtBr {
	TranslationsRecipeSearchPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Resultados da busca por "{query}"'
	TextSpan title({required InlineSpan query}) => TextSpan(children: [
		const TextSpan(text: 'Resultados da busca por "'),
		query,
		const TextSpan(text: '"'),
	]);

	/// pt-BR: '{count} receitas encontradas'
	String recipesCount({required Object count}) => '${count} receitas encontradas';

	/// pt-BR: 'Nenhuma receita encontrada'
	String get noRecipesFound => 'Nenhuma receita encontrada';

	/// pt-BR: 'Não foi possível buscar as receitas. Por favor, tente novamente.'
	String get errorLoadingRecipes => 'Não foi possível buscar as receitas. Por favor, tente novamente.';

	/// pt-BR: 'Buscando receitas...'
	String get loadingRecipes => 'Buscando receitas...';
}

// Path: recipeDetails
class TranslationsRecipeDetailsPtBr {
	TranslationsRecipeDetailsPtBr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// pt-BR: 'Vídeo'
	String get videoTutorial => 'Vídeo';

	/// pt-BR: 'Ingredientes'
	String get ingredients => 'Ingredientes';

	/// pt-BR: 'Instruções'
	String get instructions => 'Instruções';

	/// pt-BR: 'Não foi possível carregar a receita. Por favor, tente novamente.'
	String get errorLoadingRecipe => 'Não foi possível carregar a receita. Por favor, tente novamente.';

	/// pt-BR: 'Nenhuma receita encontrada'
	String get noRecipeFound => 'Nenhuma receita encontrada';
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
			'actions.backToHome' => 'Voltar ao início',
			'actions.retry' => 'Tentar novamente',
			'recipes.title' => 'Buscador de receitas',
			'recipes.searchPlaceholder' => 'Pesquisar receitas...',
			'recipes.categories' => 'Explorar categorias',
			'recipes.noCategoriesFound' => 'Nenhuma categoria encontrada',
			'recipes.suggestions' => 'Sugestões',
			'recipes.noSuggestionsFound' => 'Nenhuma sugestão encontrada',
			'recipes.loadingSuggestions' => 'Carregando sugestões...',
			'recipes.loadingCategories' => 'Carregando categorias...',
			'recipes.errorLoadingSuggestions' => 'Não foi possível carregar as sugestões. Por favor, tente novamente.',
			'recipes.errorLoadingCategories' => 'Não foi possível carregar as categorias. Por favor, tente novamente.',
			'difficultyLevel' => ({required DifficultyLevel difficulty}) { switch (difficulty) { case DifficultyLevel.easy: return 'Fácil'; case DifficultyLevel.medium: return 'Média'; case DifficultyLevel.hard: return 'Difícil'; } }, 
			'videoPlayer.errorLoadingVideo' => 'Não foi possível carregar o vídeo.\nPor favor, tente novamente.',
			'category.title' => ({required Object categoryName}) => '${categoryName}',
			'category.recipesCount' => ({required Object count}) => '${count} receitas encontradas',
			'category.noRecipesFound' => 'Nenhuma receita encontrada',
			'category.errorLoadingRecipes' => 'Não foi possível carregar as receitas. Por favor, tente novamente.',
			'category.loadingRecipes' => 'Carregando receitas...',
			'recipeSearch.title' => ({required InlineSpan query}) => TextSpan(children: [ const TextSpan(text: 'Resultados da busca por "'), query, const TextSpan(text: '"'), ]), 
			'recipeSearch.recipesCount' => ({required Object count}) => '${count} receitas encontradas',
			'recipeSearch.noRecipesFound' => 'Nenhuma receita encontrada',
			'recipeSearch.errorLoadingRecipes' => 'Não foi possível buscar as receitas. Por favor, tente novamente.',
			'recipeSearch.loadingRecipes' => 'Buscando receitas...',
			'recipeDetails.videoTutorial' => 'Vídeo',
			'recipeDetails.ingredients' => 'Ingredientes',
			'recipeDetails.instructions' => 'Instruções',
			'recipeDetails.errorLoadingRecipe' => 'Não foi possível carregar a receita. Por favor, tente novamente.',
			'recipeDetails.noRecipeFound' => 'Nenhuma receita encontrada',
			_ => null,
		};
	}
}
