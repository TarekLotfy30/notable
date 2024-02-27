import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final String icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      onPressed: onPressed,
      label: Text(
        text,
        style: TextStyles.font14Regular.copyWith(
          color: AppColors.darknessGrayColor,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      backgroundColor: AppColors.lightGrayColor,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: AppColors.whiteColor,
          width: 1,
        ),
      ),
      elevation: 0,
      avatar: Image.asset(
        icon,
        height: 17.h,
        width: 17.w,
        fit: BoxFit.cover,
      ),
    );
  }
}
