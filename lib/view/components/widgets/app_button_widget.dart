import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? buttonBackgroundColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? borderRadius;
  final String buttonText;
  final TextStyle? textStyle;
  final Widget? child;
  final BorderSide sideBorder;

  const AppButton({
    super.key,
    required this.onPressed,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonBackgroundColor,
    this.buttonWidth,
    this.buttonHeight,
    this.borderRadius,
    required this.buttonText,
    this.textStyle,
    this.child,
    required this.sideBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding?.w ?? 14.w,
          vertical: verticalPadding?.h ?? 12.h,
        ),
        backgroundColor: buttonBackgroundColor ?? AppColors.primaryColor,
        elevation: 0,
        minimumSize: Size(
          buttonWidth?.w ?? double.maxFinite,
          buttonHeight ?? 52.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          side: sideBorder,
        ),
      ),
      child: child ??
          Text(
            buttonText,
            style: textStyle ??
                TextStyles.font16Regular.copyWith(
                  color: AppColors.lightPrimaryColor,
                  fontWeight: FontWeightHelper.medium,
                ),
          ),
    );
  }
}
