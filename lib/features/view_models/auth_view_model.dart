// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_chatgpt/features/models/user_model.dart';
import 'package:news_app_chatgpt/products/constants/string_constants.dart';
import 'package:news_app_chatgpt/products/enums/Collections.dart';

import '../../products/services/index.dart';
import '../../products/widgets/snack_bars/snack_bars.dart';

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

  Future<void> signInWithGoogle(BuildContext context) async {
    isGoogleLoading = true;
    final UserCredential? userCredential = await AuthService.signInWithGoogle();
    isGoogleLoading = false;

    if (userCredential == null) return;
    final User? signInUser = userCredential.user;
    if (signInUser == null) return;

    if (userCredential.additionalUserInfo == null) return;
    if (!userCredential.additionalUserInfo!.isNewUser) return;

    await createUser(signInUser, context);
  }

  Future<void> createUser(User user, BuildContext context) async {
    UserModel userModel = UserModel(
      id: user.uid,
      name: user.displayName,
      email: user.email,
      profilePicture: user.photoURL,
      isActive: true,
    );

    bool isSuccess = await FireStoreService.createDocument(
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

  // Future<void> signInWithApple() async {
  //   isAppleLoading = true;
  //   await AuthService.signInWithApple();
  //   isAppleLoading = false;
  // }
}
