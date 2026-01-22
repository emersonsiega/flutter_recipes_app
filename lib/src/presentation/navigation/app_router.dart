import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/views/views.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => ChangeNotifierProvider<HomeViewController>(
        create: (context) => HomeViewController(
          context.read<IRecipeRepository>(),
          context.read<FetchRecipeSuggestions>(),
        ),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      name: 'recipe',
      path: '/recipe',
      redirect: (context, state) {
        final recipe = state.extra is Recipe ? state.extra as Recipe : null;
        if (recipe == null) return '/';
        return null;
      },
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return ChangeNotifierProvider<RecipeDetailsViewController>(
          create: (context) => RecipeDetailsViewController(
            context.read<IRecipeRepository>(),
          ),
          child: RecipeDetailsScreen(recipe: recipe),
        );
      },
    ),
    GoRoute(
      name: 'recipeSearch',
      path: '/recipe-search/:name',
      redirect: (context, state) {
        final name = state.pathParameters['name'] ?? '';
        if (name.isEmpty) return '/';
        return null;
      },
      builder: (context, state) {
        return ChangeNotifierProvider<RecipeSearchScreenViewModel>(
          create: (context) => RecipeSearchScreenViewModel(
            context.read<IRecipeRepository>(),
          ),
          child: RecipeSearchScreen(name: state.pathParameters['name'] ?? ''),
        );
      },
    ),
    GoRoute(
      name: 'category',
      path: '/category/:name',
      redirect: (context, state) {
        final category = state.extra is Category ? state.extra as Category : null;
        final name = state.pathParameters['name'] ?? '';
        if (category == null && name.isEmpty) return '/';
        return null;
      },
      builder: (context, state) {
        final category = state.extra as Category?;
        final name = state.pathParameters['name'] ?? '';

        return ChangeNotifierProvider<CategoryViewController>(
          create: (context) => CategoryViewController(
            context.read<IRecipeRepository>(),
          ),
          child: CategoryScreen(category: category, name: name),
        );
      },
    ),
  ],
);
