// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';

class WebEmail extends StatefulWidget {
  const WebEmail({
    required this.email,
    required this.child,
    super.key,
  });

  final String email;
  final Widget child;

  @override
  State<WebEmail> createState() => _WebEmailState();
}

class _WebEmailState extends State<WebEmail>
    with SingleTickerProviderStateMixin {
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
      onTap: () => js.context.callMethod('open', ['mailto:${widget.email}']),
      onHover: (hovered) {
        if (hovered) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.child,
          FadeTransition(
            opacity: _animation,
            child: Container(
              height: 1,
              width: 200,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
