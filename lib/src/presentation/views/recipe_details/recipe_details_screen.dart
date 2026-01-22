import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_details/recipe_details_screen_state.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_details/recipe_details_screen_viewmodel.dart';
import 'package:flutter_recipes_app/src/presentation/views/recipe_details/widgets/video_player.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  @override
  void initState() {
    super.initState();
    postFrame(() {
      context.read<RecipeDetailsViewModel>().fetchRecipeDetail(widget.recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surfaceContainer,
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              // cacheExtent: 100000,
              slivers: [
                const BackSliverAppBar(),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        RecipeHeroContainer(
                          tag: widget.recipe.id,
                          child: Material(
                            elevation: 6,
                            borderRadius: BorderRadius.circular(8),
                            child: RecipeImage(
                              recipe: widget.recipe,
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * .5,
                              fit: BoxFit.cover,
                              borderRadius: BorderRadius.circular(8),
                              sourceBorderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              destinationBorderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          widget.recipe.name,
                          style: context.textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                _buildDetails(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetails() {
    final state = context.watch<RecipeDetailsViewModel>().state;

    return switch (state) {
      RecipeDetailsState(:final isLoading) when isLoading => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CustomProgressIndicator()),
      ),
      RecipeDetailsState(:final hasError) when hasError => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ErrorMessageBox(
              message: t.recipeDetails.errorLoadingRecipe,
              onRetry: () => context.read<RecipeDetailsViewModel>().fetchRecipeDetail(widget.recipe),
            ),
          ),
        ),
      ),
      RecipeDetailsState(:final recipe) when recipe != null => SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            _RecipeChips(recipe: recipe),
            if (recipe.video != null)
              Card(
                elevation: 2,
                margin: const EdgeInsets.only(top: 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .stretch,
                    spacing: 16,
                    children: [
                      Text(
                        t.recipeDetails.videoTutorial,
                        style: context.textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                      ),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: VideoPlayer(videoUrl: recipe.video!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(top: 32),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  spacing: 16,
                  children: [
                    Text(
                      t.recipeDetails.ingredients,
                      style: context.textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                    ),
                    ...recipe.ingredients.map(
                      (ingredient) => Row(
                        spacing: 8,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: context.textTheme.bodyMedium,
                                children: [
                                  TextSpan(
                                    text: '${ingredient.measure} ',
                                    style: TextStyle(fontWeight: .bold),
                                  ),
                                  TextSpan(text: ingredient.name),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(top: 32),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .stretch,
                  spacing: 16,
                  children: [
                    Text(
                      t.recipeDetails.instructions,
                      style: context.textTheme.headlineSmall?.copyWith(fontWeight: .bold),
                    ),
                    for (var i = 0; i < recipe.instructions.length; i++)
                      Row(
                        spacing: 16,
                        children: [
                          CircleAvatar(
                            child: Text(
                              '${i + 1}',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.colorScheme.primary,
                                fontWeight: .bold,
                              ),
                            ),
                          ),
                          Expanded(child: Text(recipe.instructions[i], style: context.textTheme.bodyMedium)),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
      _ => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text(t.recipeDetails.noRecipeFound)),
      ),
    };
  }
}

class _RecipeChips extends StatelessWidget {
  final DetailedRecipe recipe;
  const _RecipeChips({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: .horizontal,
      spacing: 4,
      runSpacing: 4,
      children: [
        Chip(
          avatar: Icon(Icons.restaurant_rounded),
          label: Text(recipe.category.name),
        ),
        if (recipe.area?.isNotEmpty ?? false) Chip(avatar: Icon(Icons.location_on_outlined), label: Text(recipe.area!)),
        Chip(
          avatar: Icon(Icons.speed_rounded),
          label: Text(t.difficultyLevel(difficulty: recipe.difficulty)),
        ),
        for (final tag in recipe.tags) Chip(avatar: Icon(Icons.sell_outlined), label: Text(tag)),
      ],
    );
  }
}
