import 'package:flutter/material.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class AppSetting extends StatelessWidget {
  const AppSetting({
    super.key,
    this.icon,
    required this.text,
  });

  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.black,
        size: 25,
      ),
      title: Text(
        text,
        style: TextStyles.font16Regular.copyWith(
          fontWeight: FontWeightHelper.medium,
          color: AppColors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.black,
        size: 15,
      ),
      onTap: () {},
    );
  }
}
