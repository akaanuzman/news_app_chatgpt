// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_chatgpt/features/models/security_keys_model.dart';
import 'package:news_app_chatgpt/products/enums/Collections.dart';
import 'package:news_app_chatgpt/products/services/index.dart';
import 'package:news_app_chatgpt/products/utilities/routes/app_routes.dart';

class SplashViewModel with ChangeNotifier {
  bool _isRedirectHome = false;
  bool get isRedirectHome => _isRedirectHome;

  late String? _userId;

  SecurityKeysModel? _securityKeysModel = const SecurityKeysModel();
  SecurityKeysModel? get securityKeysModel => _securityKeysModel;

  /// Initialize app
  /// This method runs first when the application is opened and the viewmodel is loaded
  /// 1. Get security keys
  /// 2. Read user id from local storage
  /// 3. Routing decision
  Future<void> initApp(BuildContext context) async {
    await _getSecurityKeys();
    await _readUserId();
    await _routingDecision(context);
  }

  /// Get security keys from firestore
  Future<void> _getSecurityKeys() async {
    _securityKeysModel = await FireStoreService.readDocument<SecurityKeysModel>(
      model: _securityKeysModel!,
      collection: Collections.SecurityKeys,
      docId: Collections.SecurityKeys.name,
    );
  }

  /// Read user id from local storage
  /// If user id is null, redirect to login page
  Future<void> _readUserId() async {
    _userId = await LocaleStorageService().read(LocaleStorageKeys.userId.name);
    if (_userId == null) return;

    _isRedirectHome = true;
  }

  /// Routing decision
  /// If user id is null, redirect to login page
  /// If user id is not null, redirect to home page
  Future<void> _routingDecision(BuildContext context) async {
    if (_isRedirectHome) {
      context.pushReplacement("${AppRoutes.login.path}${AppRoutes.home.path}");
    } else {
      context.pushReplacement(AppRoutes.login.path);
    }
  }
}
