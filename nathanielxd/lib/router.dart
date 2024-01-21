import 'package:go_router/go_router.dart';
import 'package:nathanielxd/features/home/home.dart';

enum RoutePath {
  root;

  const RoutePath([this.name, this.parent, this.parameters]);

  final String? name;
  final RoutePath? parent;
  final List<String>? parameters;

  String get rawPath => [
        if (parent != null) parent!.rawPath,
        if (name != null) '/$name',
        if (parameters != null) parameters!.map((e) => '/:$e').join(),
      ].join();

  String path({
    List<dynamic>? pathParameters,
    Map<String, dynamic>? queryParameters,
  }) =>
      Uri(
        path: [
          if (parent != null) parent!.path(),
          if (name != null) '/$name',
          if (pathParameters != null) ...pathParameters.map((e) => '/$e'),
        ].join(),
        queryParameters: queryParameters,
      ).toString();
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
