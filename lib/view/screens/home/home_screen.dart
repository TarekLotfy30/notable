import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey! Kayla",
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 11,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Randoms",
                        style: TextStyles.font14Regular.copyWith(
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      verticalSpacing(4),
                      Text(
                        """
Last Class by Calculus; focused on design thinking and the need to apply in every aspect of the design. As a designer we need to  empathize with users. """,
                        style: TextStyles.font12Regular.copyWith(
                          fontWeight: FontWeightHelper.light,
                        ),
                      ),
                    ],
                  ),
                ),  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
