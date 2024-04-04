import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/app_text_form_field.dart';
import 'package:notable/view_model/bloc/shared_home/shared_home_cubit.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = TasksCubit.get(context);
    cubit.reset();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigation.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.primaryColor,
            size: 20.w,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocListener<TasksCubit, TasksState>(
              listener: (context, state) {
                if (state is SendTaskLoadedSuccessfullyState) {
                  Navigation.pop(context);
                  SharedHomeCubit.get(context).controller.jumpToTab(0);
                  cubit.reset();
                  showSnackBar(
                    context,
                    "Task Added Successfully",
                    AppColors.successColor,
                  );
                } else if (state is SendTaskErrorState) {
                  showSnackBar(
                    context,
                    state.error.toString(),
                    AppColors.errorColor,
                  );
                }
              },
              child: IconButton(
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.sendTask();
                  }
                },
                icon: Icon(
                  Icons.save_rounded,
                  color: AppColors.secondaryColor,
                  size: 30.w,
                ),
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
              key: cubit.formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    validate: (c) {
                      if (c == null || c.isEmpty) {
                        return "Title is required";
                      }
                      return null;
                    },
                    hintText: "Add Title",
                    keyboardType: TextInputType.multiline,
                    controller: cubit.initialTitleController,
                    textInputAction: TextInputAction.next,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    textCapitalization: TextCapitalization.sentences,
                    autofocus: true,
                    maxLines: null,
                  ),
                  AppTextFormField(
                    validate: (c) {
                      if (c == null || c.isEmpty) {
                        return "Description is required";
                      }
                      return null;
                    },
                    hintText: "Type something...",
                    keyboardType: TextInputType.multiline,
                    controller: cubit.initialDescriptionController,
                    textInputAction: TextInputAction.done,
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
                  AppTextFormField(
                    controller: cubit.initialFirstDateController,
                    keyboardType: TextInputType.none,
                    validate: (c) {
                      if (c == null || c.isEmpty) {
                        return "FirstDate is required";
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () {
                      datePicker(
                        context: context,
                        textEditingController: cubit.initialFirstDateController,
                      );
                    },
                    hintText: "FirstDate",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  verticalSpacing(10),
                  AppTextFormField(
                    controller: cubit.initialLastDateController,
                    keyboardType: TextInputType.none,
                    validate: (c) {
                      if (c == null || c.isEmpty) {
                        return "LastDate is required";
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () {
                      datePicker(
                        context: context,
                        textEditingController: cubit.initialLastDateController,
                      );
                    },
                    hintText: "LastDate",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
