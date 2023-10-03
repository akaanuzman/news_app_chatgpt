import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

import '../../constants/index.dart';
import '../../generation/index.dart';

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
