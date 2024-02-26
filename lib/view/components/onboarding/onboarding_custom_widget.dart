import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/screens/auth/login/login_screen.dart';
import 'package:notable/view_model/bloc/onboarding/onboarding_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../model/onboarding/onboarding.dart';
import '../../../view_model/utils/navigation/navigation.dart';

class OnboardingCustomWidget extends StatelessWidget {
  const OnboardingCustomWidget({
    super.key,
    required this.onboarding,
  });

  final Onboarding onboarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () {
              OnboardingCubit.get(context).savedToSharedPref();
              Navigation.pushAndRemove(
                context,
                const LoginScreen(),
              );
            },
            child: Text(
              "SKIP",
              style: TextStyles.font14Regular.copyWith(
                color: AppColors.black,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
        ),
        verticalSpacing(15),
        Image.asset(
          onboarding.image,
          width: double.infinity,
          height: 343.h,
          fit: BoxFit.cover,
        ),
        verticalSpacing(40),
        SmoothPageIndicator(
          controller: OnboardingCubit.get(context).boardController,
          count: OnboardingCubit.get(context).onboardingList.length,
          effect: WormEffect(
            dotColor: AppColors.baseGrayColor,
            activeDotColor: AppColors.primaryColor,
            dotHeight: 10.h,
            dotWidth: 10.w,
            spacing: 8.w,
          ),
        ),
        verticalSpacing(35),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            onboarding.title ?? "",
            textAlign: TextAlign.center,
            style: TextStyles.font20Regular.copyWith(
              fontWeight: FontWeightHelper.bold,
              color: AppColors.black,
            ),
          ),
        ),
        verticalSpacing(15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Text(
            onboarding.description ?? "",
            textAlign: TextAlign.center,
            style: TextStyles.font14Regular.copyWith(
              color: AppColors.black,
              fontWeight: FontWeightHelper.light,
            ),
          ),
        ),
      ],
    );
  }
}
