import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';
import 'package:flutter_recipes_app/src/presentation/views/home/home_screen_state.dart';
import 'package:flutter_recipes_app/src/presentation/views/home/home_screen_viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/views/home/widgets/widgets.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    postFrame(() {
      context.read<HomeViewController>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceContainer,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final categories = context.select<HomeViewController, AsyncData<List<Category>>>(
              (viewModel) => viewModel.state.categories,
            );
            final suggestions = context.select<HomeViewController, AsyncData<List<Recipe>>>(
              (viewModel) => viewModel.state.suggestions,
            );

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(
                    t.recipes.title,
                    style: context.textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                  ),
                  centerTitle: false,
                  backgroundColor: Colors.transparent,
                  bottom: SearchBar(
                    onSubmitted: (value) {
                      //TODO Go to search screen
                    },
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 32, bottom: 16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ..._buildSuggestions(suggestions),
                        const SizedBox(height: 32),
                        ..._buildCategories(categories),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildCategories(AsyncData<List<Category>> categories) {
    return <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Text(
          t.recipes.categories,
          style: context.textTheme.titleLarge?.copyWith(fontWeight: .bold),
        ),
      ),
      switch (categories) {
        AsyncData(:final isLoading) when isLoading => LoadingCard(description: t.recipes.loadingCategories),
        AsyncData(:final hasError) when hasError => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ErrorMessageBox(
              onRetry: context.read<HomeViewController>().fetchCategories,
              retryLabel: t.errorMessageBox.retry,
              message: t.recipes.errorLoadingCategories,
            ),
          ),
        ),
        AsyncData(:final data) when data.isNotEmpty => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
            children: List.generate(categories.data.length, (index) {
              final category = categories.data[index];
              return CategoryCard(
                key: ValueKey(category.id),
                category: category,
              );
            }),
          ),
        ),
        _ => Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text(t.recipes.noCategoriesFound)),
        ),
      },
    ];
  }

  List<Widget> _buildSuggestions(AsyncData<List<Recipe>> suggestions) {
    return [
      Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
        child: Text(
          t.recipes.suggestions,
          style: context.textTheme.titleLarge?.copyWith(fontWeight: .bold),
        ),
      ),
      switch (suggestions) {
        AsyncData(:final isLoading) when isLoading => LoadingCard(description: t.recipes.loadingSuggestions),
        AsyncData(:final hasError) when hasError => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ErrorMessageBox(
              onRetry: context.read<HomeViewController>().fetchSuggestions,
              retryLabel: t.errorMessageBox.retry,
              message: t.recipes.errorLoadingSuggestions,
            ),
          ),
        ),
        AsyncData(:final data) when data.isNotEmpty => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: List.generate(
              suggestions.data.length,
              (index) {
                final suggestion = suggestions.data[index];
                return Padding(
                  padding: index < suggestions.data.length - 1 ? const EdgeInsets.only(bottom: 16.0) : EdgeInsets.zero,
                  child: RecipeCard(
                    key: ValueKey(suggestion.id),
                    recipe: suggestion,
                  ),
                );
              },
            ),
          ),
        ),
        _ => Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text(t.recipes.noSuggestionsFound)),
        ),
      },
    ];
  }
}
