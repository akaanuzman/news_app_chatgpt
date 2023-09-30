import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_chatgpt/products/constants/string_constants.dart';
import 'package:news_app_chatgpt/products/generation/index.dart';
import 'package:news_app_chatgpt/products/utilities/extensions/image_extensions.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: context.padding.normal,
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: context.border.normalBorderRadius,
                    image: DecorationImage(
                      image: Assets.images.imgOnboard.path.assetImage,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  color: ColorName.artfulRed,
                ),
              ],
            ),
          ),
          context.sized.emptySizedHeightBoxLow3x,
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Text(
                  StringConstants.onboardTitle,
                  style: context.general.textTheme.headlineLarge,
                ),
                context.sized.emptySizedHeightBoxLow,
                Text(
                  StringConstants.onboardSubtitle,
                  style: context.general.textTheme.bodyLarge,
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
