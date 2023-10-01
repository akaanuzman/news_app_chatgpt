// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_chatgpt/products/services/index.dart';
import 'package:news_app_chatgpt/products/utilities/routes/app_routes.dart';

class SplashViewModel with ChangeNotifier {
  bool _isRedirectHome = false;
  bool get isRedirectHome => _isRedirectHome;

  String? userId;

  /// Read user id from local storage
  /// If user id is null, redirect to login page
  Future<void> _readUserId() async {
    userId = await LocaleStorageService().read(LocaleStorageKeys.userId.name);
    if (userId == null) return;

    _isRedirectHome = true;
    print("object");
  }

  /// Routing decision
  /// If user id is null, redirect to login page
  /// If user id is not null, redirect to home page
  Future<void> routingDecision(BuildContext context) async {
    await _readUserId();
    if (_isRedirectHome) {
      context.pushReplacement("${AppRoutes.login.path}${AppRoutes.navBar.path}");
    } else {
      context.pushReplacement(AppRoutes.login.path);
    }
  }
}
