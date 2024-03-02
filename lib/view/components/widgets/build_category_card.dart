import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/model/add_task/category.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class BuildCategoryCard extends StatelessWidget {
  const BuildCategoryCard({super.key, required this.category, this.onTap});

  final Category category;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: category.cardBackgroundColor,
        child: Image.asset(
          category.icon,
          alignment: Alignment.center,
          fit: BoxFit.contain,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text(
          category.title,
        ),
      ),
      titleTextStyle: TextStyles.font16Regular.copyWith(
        fontWeight: FontWeightHelper.bold,
      ),
      subtitle: Text(
        category.subtitle,
      ),
      subtitleTextStyle: TextStyles.font12Regular,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 10.h,
      ),
      horizontalTitleGap: 15.h,
      tileColor: category.iconBackgroundColor,
      splashColor: category.cardBackgroundColor,
      visualDensity: VisualDensity.compact,
    );
  }
}
