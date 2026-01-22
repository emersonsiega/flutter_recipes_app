import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_search/recipe_search_screen_state.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_search/recipe_search_screen_viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RecipeSearchScreen extends StatefulWidget {
  final String name;
  const RecipeSearchScreen({super.key, required this.name});

  @override
  State<RecipeSearchScreen> createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen> {
  @override
  void initState() {
    super.initState();
    postFrame(() {
      context.read<RecipeSearchScreenViewModel>().searchRecipesByName(widget.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RecipeSearchScreenViewModel>().state;

    return Scaffold(
      backgroundColor: context.colorScheme.surfaceContainer,
      body: CustomScrollView(
        slivers: [
          const BackSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(
                        Icons.search,
                        size: 36,
                        color: context.colorScheme.onSurface.withValues(alpha: .7),
                      ),
                      Expanded(
                        child: Text.rich(
                          t.recipeSearch.title(
                            query: TextSpan(
                              text: widget.name,
                              style: context.textTheme.headlineSmall?.copyWith(
                                fontWeight: .bold,
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                        ),
                      ),
                    ],
                  ),
                  switch (state) {
                    RecipeSearchState(isLoading: true) => Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Align(alignment: .topLeft, child: CustomProgressIndicator()),
                    ),
                    RecipeSearchState(hasError: true) => Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: ErrorMessageBox(
                        message: t.recipeSearch.errorLoadingRecipes,
                        onRetry: () => context.read<RecipeSearchScreenViewModel>().searchRecipesByName(widget.name),
                      ),
                    ),
                    RecipeSearchState(:final recipes) when recipes.isEmpty => Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Text(
                        t.recipeSearch.noRecipesFound,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.onSurface.withValues(alpha: .7),
                        ),
                      ),
                    ),
                    _ => const SizedBox.shrink(),
                  },
                ],
              ),
            ),
          ),
          if (state case RecipeSearchState(:final recipes) when recipes.isNotEmpty) ...[
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  t.recipeSearch.recipesCount(count: recipes.length),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: .7),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: index < recipes.length - 1 ? const EdgeInsets.only(bottom: 16) : EdgeInsets.zero,
                    child: RecipeCard(recipe: recipes[index]),
                  ),
                  childCount: recipes.length,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
