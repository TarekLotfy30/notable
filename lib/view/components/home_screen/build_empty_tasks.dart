import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class BuildEmptyTasks extends StatelessWidget {
  const BuildEmptyTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/illustration/Illustration.png",
          height: 240.h,
          width: 240.w,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        verticalSpacing(20),
        Text(
          "Start Your Journey",
          textAlign: TextAlign.center,
          style: TextStyles.font24Regular.copyWith(
            fontWeight: FontWeightHelper.bold,
            color: AppColors.black,
          ),
        ),
        verticalSpacing(20),
        Padding(
          padding: const EdgeInsets.only(
            left: 60,
            right: 60,
          ),
          child: Text(
            "Every big step start with small step. Notes your first idea and start your journey!",
            textAlign: TextAlign.center,
            style: TextStyles.font14Regular.copyWith(
              color: AppColors.darkGrayColor,
            ),
          ),
        ),
        verticalSpacing(30),
        Image.asset(
          "assets/images/illustration/Arrow.png",
          height: 100.h,
          width: 150.w,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        )
      ],
    );
  }
}
