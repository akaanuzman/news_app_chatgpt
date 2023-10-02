// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_chatgpt/features/models/user_model.dart';
import 'package:news_app_chatgpt/features/view_models/splash_view_model.dart';
import 'package:news_app_chatgpt/products/constants/string_constants.dart';
import 'package:news_app_chatgpt/products/enums/Collections.dart';
import 'package:news_app_chatgpt/products/utilities/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../../products/services/index.dart';
import '../../products/widgets/snack_bars/snack_bars.dart';
import '../models/security_keys_model.dart';

class AuthViewModel with ChangeNotifier {
  bool _isGoogleLoading = false;
  bool get isGoogleLoading => _isGoogleLoading;

  set isGoogleLoading(bool value) {
    _isGoogleLoading = value;
    notifyListeners();
  }

  bool _isAppleLoading = false;
  bool get isAppleLoading => _isAppleLoading;

  set isAppleLoading(bool value) {
    _isAppleLoading = value;
    notifyListeners();
  }

  /// Allows the user to sign in to the app with their google account
  Future<void> signInWithGoogle(BuildContext context) async {
    isGoogleLoading = true;
    final UserCredential? userCredential =
        await AuthService.signInWithGoogle(getClientId(context));
    isGoogleLoading = false;

    validationForSignInMethods(userCredential, context);
  }

  /// Reads the client id pulled from Firestore.
  String? getClientId(BuildContext context) {
    String? clientId;

    if (!Platform.isAndroid) {
      final SecurityKeysModel? securityKeysModel =
          context.read<SplashViewModel>().securityKeysModel;

      if (securityKeysModel == null) {
        return SnackBars.showFailureTypeSnackbar(
          context: context,
          text: StringConstants.somethingWentWrong,
        );
      }
      if (securityKeysModel.clientId == null) {
        return SnackBars.showFailureTypeSnackbar(
          context: context,
          text: StringConstants.somethingWentWrong,
        );
      }

      clientId = context.read<SplashViewModel>().securityKeysModel!.clientId;
      return clientId;
    }
    return clientId;
  }

  /// Allows the user to sign in to the app with their apple account
  Future<void> signInWithApple(BuildContext context) async {
    isAppleLoading = true;
    final UserCredential? userCredential = await AuthService.signInWithApple();
    isAppleLoading = false;

    validationForSignInMethods(userCredential, context);
  }

  /// This method checks if the returned objects are null and if the user is logged in for the first time.
  /// If the user is logged in for the first time, firestore adds a new document to the User collection in the database
  Future<void> validationForSignInMethods(
    UserCredential? userCredential,
    BuildContext context,
  ) async {
    if (userCredential == null) {
      return SnackBars.showFailureTypeSnackbar(
        context: context,
        text: StringConstants.somethingWentWrong,
      );
    }
    final User? signInUser = userCredential.user;
    if (signInUser == null) {
      return SnackBars.showFailureTypeSnackbar(
        context: context,
        text: StringConstants.somethingWentWrong,
      );
    }

    if (userCredential.additionalUserInfo == null) return;
    if (!userCredential.additionalUserInfo!.isNewUser) {
      await writeUserToLocalStorage(signInUser, context);
      return;
    }

    await createUser(signInUser, context);
    await writeUserToLocalStorage(signInUser, context);
  }

  /// If the user is logged in for the first time, firestore adds a new document to the User collection in the database
  Future<void> createUser(User user, BuildContext context) async {
    UserModel userModel = UserModel(
      id: user.uid,
      name: user.displayName,
      email: user.email,
      profilePicture: user.photoURL,
      isActive: true,
    );

    bool isSuccess = await FireStoreService.createDocument<UserModel>(
      model: userModel,
      collection: Collections.Users,
      docId: user.uid,
    );

    if (!isSuccess) {
      SnackBars.showFailureTypeSnackbar(
        context: context,
        text: StringConstants.somethingWentWrong,
      );
    }
  }

  /// Writes the user id to local storage
  Future<void> writeUserToLocalStorage(User user, BuildContext context) async {
    // If the user is logged in for the first time, the user id is saved to the device's local storage.
    await LocaleStorageService().write(
      key: LocaleStorageKeys.userId.name,
      value: user.uid,
    );
    context.pushReplacement("${AppRoutes.login.path}${AppRoutes.home.path}");
  }
}
