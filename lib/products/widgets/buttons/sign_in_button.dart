import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../generation/index.dart';
import '../../utilities/extensions/image_extensions.dart';

/// Is the enum type from which the type of button is selected.
enum ButtonType { google, apple }

class SingInButton extends StatelessWidget {
  final ButtonType buttonType;
  final void Function()? onPressed;

  /// Sets the button display according to the buttontype enum.
  ///
  /// It is the [ButtonType] enum type where the button type is selected. example: google,apple,facebook,github etc.
  /// Default value is [ButtonType.google] for [buttonType] paramater.
  const SingInButton({
    super.key,
    this.buttonType = ButtonType.google,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: isGoogle ? Assets.icons.icGoogle.svg : Assets.icons.icApple.svg,
        label: Text(isGoogle ? "Continue with Google" : "Continue with Apple"),
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
}
