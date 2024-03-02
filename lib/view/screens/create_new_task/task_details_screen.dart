import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/app_text_form_field.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save_rounded,
                color: AppColors.secondaryColor,
                size: 30.w,
              ),
            ),
          ),
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            child: Form(
              key: TasksCubit.get(context).formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    validate: (c) {
                      return null;
                    },
                    hintText: "Add Title",
                    keyboardType: TextInputType.multiline,
                    controller: TasksCubit.get(context).titleController,
                    textInputAction: TextInputAction.next,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    style: TextStyles.font24Regular.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeightHelper.medium,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    autofocus: true,
                    maxLines: null,
                  ),
                  AppTextFormField(
                    validate: (c) {
                      return null;
                    },
                    hintText: "Type something...",
                    keyboardType: TextInputType.multiline,
                    controller: TasksCubit.get(context).descriptionController,
                    textInputAction: TextInputAction.done,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    style: TextStyles.font16Regular.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeightHelper.light,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: null,
                  ),
                  /*AppTextFormField(
                    controller: cubit.firstDateController,
                    keyboardType: TextInputType.none,
                    readOnly: true,
                    onTap: () {
                      datePicker(context: context).then((value) {
                        if (value != null) {
                          cubit.firstDateController.text =
                              DateFormat.yMMMd().format(value);
                        }
                        return null;
                      });
                    },
                    labelText: "FirstDate",
                    icon: Icons.calendar_month,
                  ),
                  verticalSpacing(10),
                  AppTextFormField(
                    controller: cubit.lastDateController,
                    keyboardType: TextInputType.none,
                    readOnly: true,
                    onTap: () {
                      datePicker(context: context).then((value) {
                        if (value != null) {
                          cubit.lastDateController.text =
                              DateFormat.yMMMd().format(value);
                        }
                        return null;
                      });
                    },
                    labelText: "LastDate",
                    icon: Icons.date_range,
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
