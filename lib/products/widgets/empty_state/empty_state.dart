import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/index.dart';
import '../../generation/index.dart';

/// [EmptyState] is a [Column] with [Icon] and [Text].
/// [emptyMessage] is required.
/// [iconSize] is optional default value is [medium].
/// Show empty message and icon.
/// It is written to be shown when the items listed on the screen are empty.
class EmptyState extends StatelessWidget {
  final String emptyMessage;
  final IconSizeConstants iconSize;
  const EmptyState({
    super.key,
    required this.emptyMessage,
    this.iconSize = IconSizeConstants.medium,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.padding.normal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info,
              size: context.sized.dynamicHeight(iconSize.value),
              color: ColorName.artfulRed,
            ),
            context.sized.emptySizedHeightBoxLow,
            Text(
              emptyMessage,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
