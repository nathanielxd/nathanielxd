import 'package:flutter/material.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';

class Logo extends StatefulWidget {
  const Logo({
    required this.color,
    this.onTap,
    super.key,
  });

  final Color color;
  final void Function()? onTap;

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(begin: -0.07, end: 0.43)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.animateTo(0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: widget.color,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: RotationTransition(
              turns: _animation,
              child: Text(
                'N',
                style: context.textTheme.headlineSmall!
                    .copyWith(color: widget.color, fontFamily: 'RedditMono'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
