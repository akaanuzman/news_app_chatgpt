import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/string_constants.dart';
import '../../generation/index.dart';

final class ApproveDialog extends StatelessWidget {
  final String title;
  final String content;
  final bool isHasYesNoActions;
  final Function()? onYesPressed;
  const ApproveDialog({
    super.key,
    required this.title,
    required this.content,
    this.isHasYesNoActions = false,
    this.onYesPressed,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String content,
    bool isHasYesNoActions = false,
    Function()? onYesPressed,
  }) async {
    return await showAdaptiveDialog<bool?>(
      context: context,
      builder: (context) => ApproveDialog(
        title: title,
        content: content,
        isHasYesNoActions: isHasYesNoActions,
        onYesPressed: onYesPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(content),
      actions: !isHasYesNoActions
          ? [
              const _SpecialAction(label: StringConstants.ok),
            ]
          : [
              const _SpecialAction(label: StringConstants.no),
              _SpecialAction(
                label: StringConstants.yes,
                textColor: ColorName.artfulRed,
                onPressed: onYesPressed,
              ),
            ],
    );
  }
}

class _SpecialAction extends StatelessWidget {
  final String label;
  final Color? textColor;
  final Function()? onPressed;
  const _SpecialAction({
    required this.label,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () => Navigator.pop(context, true),
      child: Text(
        label,
        style: context.general.textTheme.bodyLarge?.copyWith(
          color: textColor ?? Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
