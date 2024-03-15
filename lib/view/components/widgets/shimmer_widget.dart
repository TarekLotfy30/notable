import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/skeleton.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 5,
        separatorBuilder: (context, index) => verticalSpacing(16),
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: AppColors.darknessGrayColor,
          highlightColor: AppColors.darkPrimaryColor,
          child: Skeleton(
            height: 100.h,
          ),
        ),
      ),
    );
  }
}
