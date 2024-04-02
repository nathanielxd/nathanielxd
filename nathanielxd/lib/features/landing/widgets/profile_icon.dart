import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';

class ProfileIcon extends StatefulWidget {
  const ProfileIcon({
    required this.icon,
    required this.label,
    this.onTap,
    super.key,
  });

  final Widget icon;
  final String label;
  final void Function()? onTap;

  @override
  State<ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.animateTo(0),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Row(
              children: [
                ScaleTransition(
                  scale: Tween<double>(begin: 1, end: 0.8).animate(
                    CurvedAnimation(parent: _controller, curve: Curves.ease),
                  ),
                  child: widget.icon,
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Curves.ease,
                    ),
                  ),
                  child: Opacity(
                    opacity: _controller.value,
                    child: Text(
                      widget.label,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
