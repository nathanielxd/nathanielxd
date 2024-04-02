import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nathanielxd/features/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.child, required this.routerState, super.key});

  final Widget child;
  final GoRouterState routerState;

  @override
  Widget build(BuildContext context) {
    return HomeView(
      routerState: routerState,
      child: child,
    );
  }
}
