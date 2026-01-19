import 'package:flutter_recipes_app/src/presentation/navigation/router_logger_observer.dart';
import 'package:flutter_recipes_app/src/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  observers: [
    RouterLoggerObserver(),
  ],
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
