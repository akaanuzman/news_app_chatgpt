import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../constants/string_constants.dart';

final class ApproveDialog extends StatelessWidget {
  final String title;
  const ApproveDialog({
    super.key,
    required this.title,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
  }) async {
    return await showAdaptiveDialog<bool?>(
      context: context,
      builder: (context) => ApproveDialog(
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text(StringConstants.somethingWentWrong),
      content: Text(title),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(
            StringConstants.ok,
            style: context.general.textTheme.bodyLarge?.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
