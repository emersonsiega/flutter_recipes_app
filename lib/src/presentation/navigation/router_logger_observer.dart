import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/infra/infra.dart';

/// Observer that logs navigation events for debugging purposes
class RouterLoggerObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    logger.d('Navigation: PUSHED = ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    logger.d('Navigation: REPLACED = ${newRoute?.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    logger.d('Navigation: POPPED = ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    logger.d('Navigation: REMOVED = ${route.settings.name}');
  }
}
