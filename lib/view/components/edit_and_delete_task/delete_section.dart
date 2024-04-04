import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/dialogs.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/images/images.dart';

class DeleteIconSection extends StatelessWidget {
  const DeleteIconSection({
    super.key,
    required this.cubit,
    required this.index,
  });

  final TasksCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showGenericDialog(
          context,
          pageBuilder: (ctx, anim1, anim2) => DialogOfTheApp(
            titleWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.deleteIcon,
                  height: 50.h,
                  width: 50.w,
                ),
                verticalSpacing(20),
                const Text(
                  "Delete Notes",
                  textAlign: TextAlign.center,
                ),
                verticalSpacing(20),
              ],
            ),
            contentWidget: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Are You sure you want to Delete this note?",
                  textAlign: TextAlign.center,
                ),
                verticalSpacing(10),
                const Text(
                  "Deleting notes mean it will be removed "
                  "permanently.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            buttonText: "Delete",
            onPressedYes: () {
              cubit.deleteTask(index);
            },
          ),
        );
      },
      icon: Icon(
        Icons.delete_outline,
        color: AppColors.primaryColor,
        size: 20.w,
      ),
    );
  }
}
