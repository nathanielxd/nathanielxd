// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';

class WebLink extends StatefulWidget {
  const WebLink({
    required this.url,
    required this.child,
    super.key,
  });

  final String url;
  final Widget child;

  @override
  State<WebLink> createState() => _WebLinkState();
}

class _WebLinkState extends State<WebLink> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => js.context.callMethod('open', [widget.url]),
      onHover: (hovered) {
        if (hovered) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizeTransition(
            sizeFactor: _animation,
            axis: Axis.horizontal,
            child: ScaleTransition(
              scale: _animation,
              child: const Icon(Icons.arrow_outward_rounded, size: 20),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
