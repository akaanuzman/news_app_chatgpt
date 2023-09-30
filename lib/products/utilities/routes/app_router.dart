import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/views/index.dart';
import 'app_routes.dart';

@immutable
final class AppRouter {
  const AppRouter._();

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash.value,
        builder: (context, state) => const SplashView(),
        routes: [
          GoRoute(
            path: AppRoutes.onBoard.value,
            builder: (context, state) => const OnBoardView(),
          ),
        ],
      ),
    ],
  );
}
