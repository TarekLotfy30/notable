import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notable/view/screens/auth/login/login_screen.dart';
import 'package:notable/view/screens/onboarding/onboarding_screen.dart';
import 'package:notable/view/screens/shared_home/shared_home.dart';
import 'package:notable/view_model/bloc/onboarding/onboarding_cubit.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _navigateToNextScreen(BuildContext context) {
    final bool skipOnBoarding =
        LocalData.get(key: AppSharedKeys.skipOnBoarding) == true;
    final Widget nextScreen;
    if (skipOnBoarding) {
      if (LocalData.get(key: AppSharedKeys.token) == null) {
        nextScreen = const LoginScreen();
      } else {
        nextScreen = const SharedHome();
      }
    } else {
      nextScreen = BlocProvider(
        create: (context) => OnboardingCubit(),
        child: const OnBoardingScreen(),
      );
    }
    Navigation.pushAndRemove(context, nextScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "notable.",
              textStyle: TextStyles.font32Regular.copyWith(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 150),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          onFinished: () => _navigateToNextScreen(context),
        ),
      ),
    );
  }
}
