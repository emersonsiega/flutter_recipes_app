import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';
import 'package:flutter_recipes_app/src/presentation/views/category/category_screen_state.dart';
import 'package:flutter_recipes_app/src/presentation/views/category/category_screen_viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final Category? category;
  final String name;

  const CategoryScreen({super.key, this.category, required this.name});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    postFrame(() {
      context.read<CategoryViewController>().fetchRecipes(widget.category, widget.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CategoryViewController>().state;

    return Scaffold(
      backgroundColor: context.colorScheme.surfaceContainer,
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            const BackSliverAppBar(),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      t.category.title(categoryName: widget.name),
                      style: context.textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                    ),
                    if (widget.category?.description?.isNotEmpty ?? false) ...[
                      const SizedBox(height: 16),
                      Text(
                        widget.category!.description!,
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                    switch (state) {
                      CategoryState(isLoading: true) => Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Align(alignment: .topLeft, child: CustomProgressIndicator()),
                      ),
                      CategoryState(hasError: true) => Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: ErrorMessageBox(
                          message: t.category.errorLoadingRecipes,
                          onRetry: () =>
                              context.read<CategoryViewController>().fetchRecipes(widget.category, widget.name),
                        ),
                      ),
                      CategoryState(:final recipes) when recipes.isEmpty => Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Text(
                          t.category.noRecipesFound,
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
            if (state case CategoryState(:final recipes) when recipes.isNotEmpty) ...[
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    t.category.recipesCount(count: recipes.length),
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
      ),
    );
  }
}
