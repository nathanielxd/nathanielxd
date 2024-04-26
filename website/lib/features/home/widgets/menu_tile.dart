import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    required this.onTap,
    required this.label,
    required this.color,
    super.key,
  });

  final void Function() onTap;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            label,
            style: TextStyle(color: color, fontFamily: 'RedditMono'),
          ),
        ),
      ),
    );
  }
}
