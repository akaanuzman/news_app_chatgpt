import 'package:flutter/material.dart';

import '../../generation/index.dart';

@immutable
final class AppTextTheme {
  final TextTheme _textTheme = const TextTheme(
    // Nantes Fonts Text Styles
    headlineLarge: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      color: ColorName.label,
      fontFamily: FontFamily.nantes,
    ),
    headlineMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: ColorName.label,
      fontFamily: FontFamily.nantes,
    ),

    // **************

    // Inter Fonts Text Styles
    bodyLarge: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: ColorName.kettleman,
      fontFamily: FontFamily.inter,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: ColorName.kettleman,
      fontFamily: FontFamily.inter,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: ColorName.kettleman,
      fontFamily: FontFamily.inter,
    ),
    headlineSmall: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      color: ColorName.artfulRed,
      fontFamily: FontFamily.inter,
    ),

    // **************

    // SFPro Fonts Text Styles
    labelLarge: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: ColorName.kettleman,
      fontFamily: FontFamily.sFPro,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: ColorName.artfulRed,
      fontFamily: FontFamily.sFPro,
    ),
  );

  TextTheme get textTheme => _textTheme;
}
