import 'package:flutter/material.dart';

import 'widgets/onboarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/onBoardingScreen';

  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingScreenBody(),
    );
  }
}
