import 'package:flutter/material.dart';
import 'features/view_models/splash_view_model.dart';
import 'package:provider/provider.dart';

import 'products/constants/app_constants.dart';
import 'products/initialize/app_initialize.dart';
import 'products/utilities/routes/app_router.dart';
import 'products/utilities/theme/app_theme.dart';

void main() async {
  await AppInitialize.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      debugShowCheckedModeBanner: AppConstants.isShowDebugBanner,
      title: AppConstants.appName,
      theme: AppTheme().currentTheme,
    );
  }
}
