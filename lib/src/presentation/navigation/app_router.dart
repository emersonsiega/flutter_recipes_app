import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/navigation/router_logger_observer.dart';
import 'package:flutter_recipes_app/src/presentation/views/views.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final appRouter = GoRouter(
  observers: [
    RouterLoggerObserver(),
  ],
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
      name: 'category',
      path: '/category',
      redirect: (context, state) {
        final category = state.extra is Category ? state.extra as Category : null;
        if (category == null) return '/';
        return null;
      },
      builder: (context, state) {
        final category = state.extra as Category;
        return ChangeNotifierProvider<CategoryViewController>(
          create: (context) => CategoryViewController(
            context.read<IRecipeRepository>(),
          ),
          child: CategoryScreen(category: category),
        );
      },
    ),
  ],
);
