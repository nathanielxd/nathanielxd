import 'package:flutter/material.dart';

class PaddingVertical extends StatelessWidget {
  const PaddingVertical(this.value, {super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}
