import 'package:flutter/material.dart';

class PaddingHorizontal extends StatelessWidget {
  const PaddingHorizontal(this.value, {super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}
