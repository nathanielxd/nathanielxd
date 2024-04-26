import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({required this.body, this.maxWidth = 600, super.key});

  final Widget body;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
