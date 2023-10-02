import 'package:flutter/material.dart';

class AdaptiveLoadingProccess extends StatelessWidget {
  const AdaptiveLoadingProccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
