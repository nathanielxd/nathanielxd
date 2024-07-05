import 'package:flutter/material.dart';
import 'package:nathanielxd/gen/fonts.gen.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'package:nathanielxd/theme/theme.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String label;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        shape: Border.all(width: 2),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: FontFamily.bebasNeue,
                  color: context.colorScheme.surface,
                ),
              ),
              const PaddingHorizontal(16),
              Icon(icon, color: context.colorScheme.surface),
            ],
          ),
        ),
      ),
    );
  }
}
