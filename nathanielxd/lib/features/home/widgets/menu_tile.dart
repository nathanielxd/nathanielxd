import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    required this.page,
    required this.color,
    super.key,
  });

  final String page;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go('/$page'),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            page,
            style: TextStyle(color: color, fontFamily: 'RedditMono'),
          ),
        ),
      ),
    );
  }
}
