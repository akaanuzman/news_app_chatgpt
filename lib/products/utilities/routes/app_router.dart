import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../services/index.dart';

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
            path: AppRoutes.login.value,
            builder: (context, state) => const LoginView(),
            routes: [
              GoRoute(
                path: AppRoutes.navBar.value,
                builder: (context, state) => Scaffold(
                  body: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          LocaleStorageService().deleteAll();
                        },
                        child: const Text("Clear Cache")),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
