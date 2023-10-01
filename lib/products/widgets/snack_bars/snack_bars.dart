import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_chatgpt/products/generation/index.dart';

@immutable
final class SnackBars {
  const SnackBars._();

  // TODO: REFACTOR THIS SNACKBAR
  static showFailureTypeSnackbar({
    required BuildContext context,
    required String text,
    EdgeInsets? margin,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: context.duration.durationNormal,
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorName.artfulRed,
        margin: margin,
        shape: RoundedRectangleBorder(
          borderRadius: context.border.lowBorderRadius,
        ),
        content: Center(
          child: Text(
            text,
            style: context.general.textTheme.bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
