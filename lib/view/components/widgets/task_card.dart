import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/model/task/task.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final Tasks task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${task.title}",
                style: TextStyles.font14Regular.copyWith(
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              Text(
                "${task.startDate}",
                style: TextStyles.font8Regular.copyWith(
                  fontWeight: FontWeightHelper.light,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          verticalSpacing(4),
          Text(
            "${task.description}",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyles.font12Regular.copyWith(
              fontWeight: FontWeightHelper.light,
            ),
          ),
        ],
      ),
    );
  }
}
