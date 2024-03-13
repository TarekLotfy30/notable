import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/app_button_widget.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      sideBorder: BorderSide(
        color: AppColors.primaryColor,
        width: 1.w,
      ),
      onPressed: () {},
      buttonBackgroundColor: AppColors.whiteColor,
      borderRadius: 100,
      textStyle: TextStyles.font16Regular.copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeightHelper.medium,
      ),
      buttonText: '',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.edit_note_outlined,
          ),
          horizontalSpacing(8),
          Text(
            "Edit Profile",
            style: TextStyles.font16Regular.copyWith(
              fontWeight: FontWeightHelper.medium,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
