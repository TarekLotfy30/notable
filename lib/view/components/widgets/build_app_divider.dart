import 'package:flutter/material.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';

class BuildAppDivider extends StatelessWidget {
  const BuildAppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.lightGrayColor,
      thickness: 1,
    );
  }
}
