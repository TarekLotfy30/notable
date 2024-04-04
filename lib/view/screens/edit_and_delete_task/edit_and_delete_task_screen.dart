import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/edit_and_delete_task/build_task_form.dart';
import 'package:notable/view/components/edit_and_delete_task/delete_section.dart';
import 'package:notable/view/components/edit_and_delete_task/edit_section.dart';
import 'package:notable/view/screens/shared_home/shared_home.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';

class EditAndDeleteTaskScreen extends StatelessWidget {
  const EditAndDeleteTaskScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = TasksCubit.get(context);
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
          BlocListener<TasksCubit, TasksState>(
            listener: (context, state) {
              if (state is DeleteTaskLoaded) {
                Navigation.pushAndRemove(context, const SharedHome());
                showSnackBar(
                  context,
                  "Task Deleted Successfully",
                  AppColors.successColor,
                );
              } else if (state is DeleteTaskError) {
                showSnackBar(
                  context,
                  state.error.toString(),
                  AppColors.errorColor,
                );
              }
            },
            child: DeleteIconSection(cubit: cubit, index: index),
          ),
          BlocListener<TasksCubit, TasksState>(
            listener: (context, state) {
              if (state is UpdateTaskLoaded) {
                Navigation.pushAndRemove(context, const SharedHome());
                showSnackBar(
                  context,
                  "Task Updated Successfully",
                  AppColors.successColor,
                );
              } else if (state is UpdateTaskError) {
                showSnackBar(
                  context,
                  state.error.toString(),
                  AppColors.errorColor,
                );
              } else if (state is UpdateTaskWarning) {
                Navigation.pop(context);
                showSnackBar(
                  context,
                  "No changes made to the task",
                  AppColors.warningColor,
                );
              }
            },
            child: EditIconSection(cubit: cubit, index: index),
          ),
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            child: BuildTaskForm(cubit: cubit),
          ),
        ),
      ),
    );
  }
}
