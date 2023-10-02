import 'package:flutter/material.dart';

@immutable
final class AppConstants {
  const AppConstants._();

  static const String appName = 'News App';
  static const bool isShowDebugBanner = false;
  static const String newsBaseUrl = 'https://gnews.io/api/v4/';
}