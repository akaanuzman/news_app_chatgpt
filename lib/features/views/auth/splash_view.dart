import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import '../../../products/constants/app_constants.dart';
import '../../../products/generation/index.dart';
import '../../../products/utilities/routes/app_routes.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 2),
          () => context.go(AppRoutes.onBoard.path)
        ),
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
        }
      ),
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
