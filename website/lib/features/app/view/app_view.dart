import 'package:flutter/material.dart';
import 'package:nathanielxd/router.dart';
import 'package:nathanielxd/theme/style/main_style.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: MainTheme.theme,
      title: 'Nathaniel Dragusin',
      routerConfig: router,
    );
  }
}
