import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';

@immutable
final class AppInitialize {
  const AppInitialize._();

  static Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
