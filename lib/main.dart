import 'package:flutter/material.dart';
import 'features/views/auth/on_board_view.dart';
import 'products/constants/app_constants.dart';
import 'products/utilities/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: AppConstants.isShowDebugBanner,
      title: AppConstants.appName,
      theme: AppTheme().currentTheme,
      home: const OnBoardView(),
    );
  }
}
