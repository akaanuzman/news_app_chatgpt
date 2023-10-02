import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_chatgpt/products/utilities/extensions/image_extensions.dart';

import '../../constants/string_constants.dart';
import '../../generation/index.dart';

/// Is the enum type from which the type of button is selected.
enum ButtonType { google, apple }

class SignInButton extends StatelessWidget {
  final ButtonType buttonType;
  final void Function()? onPressed;
  final bool isLoading;

  /// Sets the button display according to the buttontype enum.
  ///
  /// It is the [ButtonType] enum type where the button type is selected. example: google,apple,facebook,github etc.
  /// Default value is [ButtonType.google] for [buttonType] paramater.
  const SignInButton({
    super.key,
    this.buttonType = ButtonType.google,
    this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton.icon(
        onPressed: isLoading ? () {} : onPressed,
        icon: icon,
        label: label,
        style: ElevatedButton.styleFrom(
          backgroundColor: isGoogle ? ColorName.white : ColorName.chaosBlack,
          foregroundColor: isGoogle ? ColorName.label : ColorName.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: isGoogle
                ? const BorderSide(color: ColorName.shade)
                : BorderSide.none,
            borderRadius: context.border.highBorderRadius,
          ),
          padding: context.padding.verticalNormal,
        ),
      ),
    );
  }

  bool get isGoogle => buttonType == ButtonType.google;
  Widget get icon => isLoading
      ? Container()
      : isGoogle
          ? Assets.icons.icGoogle.svg
          : Assets.icons.icApple.svg;
  Widget get label => isLoading
      ? const CircularProgressIndicator.adaptive()
      : Text(isGoogle
          ? StringConstants.googleSignIn
          : StringConstants.appleSignIn);
}
