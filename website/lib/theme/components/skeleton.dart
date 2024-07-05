import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    required this.body,
    this.maxWidth = 600,
    this.backgroundColor,
    super.key,
  });

  final Widget body;
  final double maxWidth;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: SelectionArea(
                child: body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
