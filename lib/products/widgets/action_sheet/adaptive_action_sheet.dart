import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:news_app_chatgpt/products/constants/index.dart';
import 'package:news_app_chatgpt/products/generation/index.dart';

final class AdaptiveActionSheet {
  AdaptiveActionSheet._();

  static show(BuildContext context) {
    showAdaptiveActionSheet(
      context: context,
      actions: [
        BottomSheetAction(
          title: const Text(
            StringConstants.summurizeTheNews,
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: (context) {
            Navigator.pop(context);
          },
        ),
      ],
      cancelAction: CancelAction(
        title: const Text(
          StringConstants.cancel,
          style: TextStyle(
            color: ColorName.artfulRed,
          ),
        ),
        onPressed: (context) {
          Navigator.pop(context);
        },
      ),
    );
  }
}
