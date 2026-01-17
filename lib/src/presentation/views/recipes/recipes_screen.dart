import 'package:flutter/material.dart' hide SearchBar, ProgressIndicator;
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/recipes_screen_state.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/recipes_screen_viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipes/widgets/category_list_tile.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  void initState() {
    super.initState();
    postFrame(() {
      context.read<RecipesScreenViewModel>().fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.recipes.title),
        bottom: SearchBar(
          query: context.select<RecipesScreenViewModel, String>(
            (viewModel) => viewModel.state is SuccessState ? (viewModel.state as SuccessState).query : '',
          ),
          onSubmitted: (value) {
            context.read<RecipesScreenViewModel>().searchRecipes(value);
          },
        ),
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final state = context.watch<RecipesScreenViewModel>().state;
        
            return switch (state) {
              LoadingState() || IdleState() => const Center(child: CustomProgressIndicator()),
              SuccessState(:final searching) when searching => Center(
                child: Row(
                  mainAxisAlignment: .center,
                  spacing: 8,
                  children: [
                    CustomProgressIndicator(size: 18),
                    Text(t.recipes.searching),
                  ],
                ),
              ),
              SuccessState(:final categories) when categories.isNotEmpty => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: index == categories.length - 1 ? 0 : 16),
                    child: CategoryListTile(
                      key: ValueKey(categories[index].id),
                      category: categories[index],
                    ),
                  );
                },
              ),
              ErrorState() => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ErrorMessageBox(
                    onRetry: context.read<RecipesScreenViewModel>().fetchCategories,
                    retryLabel: t.recipes.retry,
                  ),
                ),
              ),
              _ => Center(child: Text(t.recipes.noCategoriesFound)),
            };
          },
        ),
      ),
    );
  }
}
