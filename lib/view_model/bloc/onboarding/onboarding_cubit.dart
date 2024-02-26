import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/utils/images/images.dart';

import '../../../model/onboarding/onboarding.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) =>
      BlocProvider.of<OnboardingCubit>(context);

  var boardController = PageController();

  int currentIndex = 0;
  void onPageChanged(value) {
    currentIndex = value;
    emit(OnboardingChangePage());
  }

  bool isLast = false;

  List<Onboarding> onboardingList = [
    Onboarding(
      AppImages.onboarding1,
      "An Actual notebook in your pocket",
      "Take notes quickly and easily. Get your ideas penned down, where ever "
          "and when ever",
    ),
    Onboarding(
      AppImages.onboarding2,
      "Great way to collaborate and share",
      "Now you can save and access your notes online. collaborate and share "
          "your notes with friends or circles",
    ),
  ];

  void savedToSharedPref() {
    LocalData.set(
      key: AppSharedKeys.skipOnBoarding,
      value: true,
    );
  }
}
