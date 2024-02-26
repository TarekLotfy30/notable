import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/onboarding/onboarding_custom_widget.dart';
import 'package:notable/view/components/widgets/app_button_widget.dart';
import 'package:notable/view/screens/auth/login/login_screen.dart';
import 'package:notable/view_model/bloc/onboarding/onboarding_cubit.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';

part '../../components/onboarding/button.dart';
part '../../components/onboarding/page_view.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OnboardingCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: _OnboardingPageView(cubit: cubit),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: _Button(cubit: cubit),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
