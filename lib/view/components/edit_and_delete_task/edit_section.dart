import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/dialogs.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/images/images.dart';

class EditIconSection extends StatelessWidget {
  const EditIconSection({
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
        if (cubit.formKey.currentState!.validate()) {
          showGenericDialog(
            context,
            pageBuilder: (ctx, anim1, anim2) => DialogOfTheApp(
              verticalActionPadding: 10,
              buttonTextOfCancelAction: "Discard",
              titleWidget: Image.asset(
                AppImages.editIcon,
                height: 50.h,
                width: 50.w,
              ),
              contentWidget: const Text(
                "Save Changes?",
                textAlign: TextAlign.center,
              ),
              buttonText: "Save",
              onPressedYes: () {
                cubit.updateTask(index);
              },
            ),
          );
        }
      },
      icon: Icon(
        Icons.edit,
        color: AppColors.primaryColor,
        size: 20.w,
      ),
    );
  }
}
