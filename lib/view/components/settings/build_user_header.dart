import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class BuildUserHeader extends StatelessWidget {
  const BuildUserHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
          ),
        ),
        horizontalSpacing(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocalData.get(key: AppSharedKeys.name) ?? '',
              style: TextStyles.font20Regular.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            verticalSpacing(10),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  color: AppColors.darkGrayColor,
                  size: 15.sp,
                ),
                horizontalSpacing(8),
                Text(
                  LocalData.get(key: AppSharedKeys.email) ?? '',
                  style: TextStyles.font12Regular.copyWith(
                    color: AppColors.darkGrayColor,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
