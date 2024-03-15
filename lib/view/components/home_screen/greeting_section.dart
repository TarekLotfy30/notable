import 'package:flutter/material.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hey! ${LocalData.get(key: AppSharedKeys.name)}",
          style: TextStyles.font14Regular.copyWith(
            fontWeight: FontWeightHelper.medium,
            color: AppColors.black,
          ),
        ),
        verticalSpacing(4),
        Text(
          "Let’s start making notes",
          style: TextStyles.font12Regular.copyWith(
            fontWeight: FontWeightHelper.light,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
