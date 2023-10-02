import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../products/constants/app_constants.dart';
import '../../../products/generation/index.dart';
import '../../view_models/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final splashViewModel = Provider.of<SplashViewModel>(context);

    return Scaffold(
      body: FutureBuilder(
          future: splashViewModel.initApp(context),
          builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _AppNewspaperIcon(),
                  _AppNameTitle(),
                ],
              ),
            );
          }),
    );
  }
}

class _AppNewspaperIcon extends StatelessWidget {
  const _AppNewspaperIcon();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.newspaper,
      color: ColorName.label,
      size: context.sized.width * 0.1,
    );
  }
}

class _AppNameTitle extends StatelessWidget {
  const _AppNameTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppConstants.appName,
      style: context.general.textTheme.headlineLarge,
    );
  }
}
