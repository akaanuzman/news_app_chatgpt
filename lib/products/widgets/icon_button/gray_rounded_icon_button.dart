import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_chatgpt/products/constants/index.dart';
import 'package:news_app_chatgpt/products/generation/colors.gen.dart';

class GrayRoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const GrayRoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.padding.low,
      decoration: BoxDecoration(
        color: ColorName.whiteBox,
        borderRadius: context.border.lowBorderRadius,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: context.sized.dynamicWidth(IconSizeConstants.small.value),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
