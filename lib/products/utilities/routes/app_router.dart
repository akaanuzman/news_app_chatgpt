import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_chatgpt/features/models/news_model.dart';
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
                path: AppRoutes.home.value,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.newsDetail.value,
        builder: (context, state) {
          NewsModel newsModel = state.extra as NewsModel;
          return NewsDetailView(news: newsModel);
        },
      ),
    ],
  );
}
