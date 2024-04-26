import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nathanielxd/features/home/home.dart';
import 'package:nathanielxd/plugins/theme_extension.dart';
import 'dart:js' as js;

class HomeView extends StatelessWidget {
  const HomeView({
    required this.routerState,
    required this.child,
    super.key,
  });

  final Widget child;
  final GoRouterState routerState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Logo(
                  color: routerState.matchedLocation == '/'
                      ? context.colorScheme.onBackground
                      : context.textTheme.bodyLarge!.color!,
                  onTap: () => context.go('/'),
                ),
              ),
              ...['resume'].map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: MenuTile(
                    onTap: () => context.go('/$e'),
                    label: e,
                    color: routerState.matchedLocation == '/$e'
                        ? context.colorScheme.onBackground
                        : context.textTheme.bodyLarge!.color!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: MenuTile(
                  onTap: () => js.context.callMethod(
                    'open',
                    ['https://github.com/nathanielxd'],
                  ),
                  label: 'portfolio',
                  color: context.textTheme.bodyLarge!.color!,
                ),
              ),
            ],
          ),
          Divider(
            height: 0,
            color: context.colorScheme.onBackground.withOpacity(0.1),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
