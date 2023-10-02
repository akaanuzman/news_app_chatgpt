// ignore_for_file: body_might_complete_normally_catch_error

import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app_chatgpt/features/models/security_keys_model.dart';
import 'package:news_app_chatgpt/features/view_models/splash_view_model.dart';
import 'package:provider/provider.dart';

@immutable
final class AuthService {
  const AuthService._();

  /// `signInWithGoogle` method
  /// Allows login with Google account and returns UserCredential? object.
  static Future<UserCredential?> signInWithGoogle(String? clientId) async {

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(clientId: clientId).signIn();

      if (googleUser == null) return null;

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      return null;
    }
  }

  /// `signInWithApple` method
  /// Allows login with Google account and returns UserCredential? object.
  static Future<UserCredential?> signInWithApple() async {
    try {
      final AppleAuthProvider appleAuthProvider = AppleAuthProvider();
      return await FirebaseAuth.instance.signInWithProvider(appleAuthProvider);
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      return null;
    }
  }
}
