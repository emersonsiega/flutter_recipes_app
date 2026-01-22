import 'package:flutter/material.dart';

class RecipeHeroContainer extends StatelessWidget {
  final Widget child;
  final String tag;
  const RecipeHeroContainer({super.key, required this.child, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      transitionOnUserGestures: true,
      flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
        final Hero toHero = toHeroContext.widget as Hero;

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: flightDirection == .push ? toHero.child : fromHeroContext.widget,
            );
          },
        );
      },
      child: child,
    );
  }
}
