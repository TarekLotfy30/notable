part of '../../screens/onboarding/onboarding_screen.dart';

class _OnboardingPageView extends StatelessWidget {
  const _OnboardingPageView({
    required this.cubit,
  });

  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) => OnboardingCustomWidget(
        onboarding: cubit.onboardingList[index],
      ),
      controller: cubit.boardController,
      itemCount: cubit.onboardingList.length,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) {
        cubit.onPageChanged(value);
        if (value == cubit.onboardingList.length - 1) {
          cubit.isLast = true;
        } else {
          cubit.isLast = false;
        }
      },
    );
  }
}
