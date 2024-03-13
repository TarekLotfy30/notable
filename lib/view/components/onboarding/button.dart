part of '../../screens/onboarding/onboarding_screen.dart';

class _Button extends StatelessWidget {
  const _Button({
    required this.cubit,
  });

  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return AppButton(
          sideBorder: BorderSide.none,
          buttonText: cubit.currentIndex == cubit.onboardingList.length - 1
              ? "Get Started"
              : "Next",
          onPressed: () {
            if (cubit.isLast) {
              Navigation.pushAndRemove(
                context,
                const LoginScreen(),
              );
              cubit.savedToSharedPref();
            } else {
              cubit.boardController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
              );
            }
          },
          borderRadius: 100,
          buttonWidth: 212,
        );
      },
    );
  }
}
