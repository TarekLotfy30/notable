import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/app_button_widget.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';

import '../../../view_model/utils/styles/text_style.dart';

class DialogOfTheApp extends StatelessWidget {
  const DialogOfTheApp({
    super.key,
    this.title,
    this.content,
    required this.onPressedYes,
    this.buttonText,
    this.titleWidget,
    this.contentWidget,
    this.verticalActionPadding,
    this.buttonTextOfCancelAction,
  });

  final String? title;
  final String? content;
  final void Function() onPressedYes;
  final String? buttonText;
  final Widget? titleWidget;
  final Widget? contentWidget;
  final double? verticalActionPadding;
  final String? buttonTextOfCancelAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: titleWidget ??
          Text(
            title ?? "",
            textAlign: TextAlign.center,
          ),
      content: contentWidget ??
          Text(
            content ?? "",
            textAlign: TextAlign.center,
          ),
      actions: [
        //cancel
        AppButton(
          buttonBackgroundColor: AppColors.whiteColor,
          borderRadius: 50,
          buttonWidth: 100,
          buttonText: buttonTextOfCancelAction ?? "Cancel",
          textStyle: TextStyles.font16Regular.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeightHelper.medium,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          sideBorder: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        //yes
        AppButton(
          buttonBackgroundColor: AppColors.primaryColor,
          borderRadius: 50,
          buttonWidth: 120,
          buttonText: buttonText ?? "Yes",
          textStyle: TextStyles.font16Regular.copyWith(
            color: AppColors.whiteColor,
            fontWeight: FontWeightHelper.medium,
          ),
          sideBorder: BorderSide(
            color: AppColors.primaryColor,
          ),
          onPressed: onPressedYes,
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 1,
      backgroundColor: AppColors.lightPrimaryColor,
      titleTextStyle: TextStyles.font20Regular.copyWith(
        color: AppColors.black,
        fontWeight: FontWeightHelper.bold,
      ),
      contentTextStyle: TextStyles.font16Regular.copyWith(
        color: AppColors.darkGrayColor,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: verticalActionPadding ?? 30.h,
      ),
      actionsOverflowAlignment: OverflowBarAlignment.start,
      actionsOverflowDirection: VerticalDirection.down,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 40.w,
      ),
    );
  }
}
