import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/custom_progress_indicator.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  const CachedImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return const SizedBox.shrink();

    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      width: 80,
      placeholder: (context, url) => CustomProgressIndicator(size: 18),
      errorWidget: (context, url, error) => Icon(Icons.error, size: 24),
    );
  }
}
