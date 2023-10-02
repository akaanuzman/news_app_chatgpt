import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_chatgpt/products/utilities/extensions/index.dart';
import 'package:provider/provider.dart';

import '../../../products/constants/string_constants.dart';
import '../../../products/generation/index.dart';
import '../../../products/widgets/buttons/sign_in_button.dart';
import '../../view_models/auth_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: context.padding.normal,
      child: Column(
        children: [
          const Spacer(),
          const Expanded(
            flex: 10,
            child: _BigRoundedImage(),
          ),
          context.sized.emptySizedHeightBoxLow3x,
          const Expanded(
            flex: 11,
            child: _TitleSubtitleAndSignInButtons(),
          ),
        ],
      ),
    ));
  }
}

class _BigRoundedImage extends StatelessWidget {
  const _BigRoundedImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.border.normalBorderRadius,
        image: DecorationImage(
          image: Assets.images.imgOnboard.path.assetImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TitleSubtitleAndSignInButtons extends StatelessWidget {
  const _TitleSubtitleAndSignInButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title: Get the latest and updates....
        Text(
          StringConstants.onboardTitle,
          style: context.general.textTheme.headlineLarge,
        ),

        context.sized.emptySizedHeightBoxLow,

        // Subtitle: Get the latest and updates....
        Text(
          StringConstants.onboardSubtitle,
          style: context.general.textTheme.bodyLarge,
        ),

        context.sized.emptySizedHeightBoxLow3x,

        // Google Button
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(),
          child: Consumer<AuthViewModel>(
            builder: (context, viewModel, child) => SignInButton(
              onPressed: () => viewModel.signInWithGoogle(context),
              isLoading: viewModel.isGoogleLoading,
            ),
          ),
        ),

        context.sized.emptySizedHeightBoxLow3x,

        // Apple Button only show on iOS or MacOS
        Visibility(
          visible: Platform.isIOS || Platform.isMacOS,
          child: ChangeNotifierProvider<AuthViewModel>(
            create: (_) => AuthViewModel(),
            child: Consumer<AuthViewModel>(
              builder: (context, viewModel, child) => SignInButton(
                onPressed: () => viewModel.signInWithApple(context),
                isLoading: viewModel.isAppleLoading,
                buttonType: ButtonType.apple,
              ),
            ),
          ),
        )
      ],
    );
  }
}
