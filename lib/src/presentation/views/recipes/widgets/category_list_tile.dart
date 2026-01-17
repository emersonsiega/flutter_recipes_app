import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/domain/domain.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/widgets/widgets.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  const CategoryListTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //TODO: Navigate to the category recipes screen
      },
      tileColor: context.colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: CustomCircleAvatar(text: category.name.substring(0, 1)),
      trailing: CachedImage(imageUrl: category.imageUrl?.toString()),
      title: Text(category.name),
      subtitle: Text(category.description ?? '', maxLines: 2, overflow: .ellipsis),
    );
  }
}
