import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/src/presentation/extensions/extensions.dart';
import 'package:flutter_recipes_app/src/presentation/i18n/i18n.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSubmitted;

  const SearchBar({super.key, required this.onSubmitted});

  @override
  State<SearchBar> createState() => _SearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(75);
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: _controller,
        style: TextStyle(color: context.colorScheme.onSurface),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, size: 20),
          hintText: t.recipes.searchPlaceholder,
          suffixIcon: ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              return Visibility(
                visible: _controller.text.isNotEmpty,
                child: GestureDetector(
                  behavior: .opaque,
                  onTap: _controller.text.isNotEmpty
                      ? () {
                          _controller.clear();
                          widget.onSubmitted('');
                        }
                      : null,
                  child: Icon(Icons.clear, size: 20, color: context.colorScheme.onSurface),
                ),
              );
            },
          ),
        ),
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
