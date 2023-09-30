import 'package:flutter/material.dart';
import '../../generation/index.dart';
import 'app_text_theme.dart';

@immutable
final class AppTheme {
  late final ThemeData _themeData;

  AppTheme() {
    _themeData = ThemeData.light();
  }

  ThemeData get currentTheme => _themeData.copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorName.artfulRed,
        ),
        textTheme: AppTextTheme().textTheme,
      );
}
