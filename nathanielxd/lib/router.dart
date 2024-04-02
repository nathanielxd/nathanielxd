import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nathanielxd/features/home/home.dart';
import 'package:nathanielxd/features/landing/landing.dart';
import 'package:nathanielxd/features/resume/resume.dart';

CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) =>
          HomePage(routerState: state, child: child),
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const LandingPage(),
          ),
        ),
        GoRoute(
          path: '/resume',
          parentNavigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const ResumePage(),
          ),
        ),
      ],
    ),
  ],
);
