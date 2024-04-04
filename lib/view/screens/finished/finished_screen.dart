import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/model/task/task.dart';
import 'package:notable/view/components/widgets/shimmer_widget.dart';
import 'package:notable/view/components/widgets/task_card.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/images/images.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class FinishedScreen extends StatelessWidget {
  const FinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskCubit = TasksCubit.get(context);
    return BlocProvider.value(
      value: taskCubit..getFinishedTasks(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //header
              Container(
                height: 150.h,
                color: AppColors.primaryColor,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Amazing Journey!",
                              style: TextStyles.font20Regular.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                            verticalSpacing(8),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 60,
                              ),
                              child: Text(
                                "You have successfully finished 5 notes.",
                                style: TextStyles.font12Regular.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        AppImages.finishedHeader,
                        height: 160.h,
                        width: 130.w,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpacing(20),
              BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  return Visibility(
                    visible: state is! TasksLoadingState,
                    replacement: const ShimmerWidget(),
                    child: Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            verticalSpacing(10),
                        itemCount:
                            taskCubit.taskModel2.data?.tasks?.length ?? 0,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => TaskCard(
                          task: taskCubit.taskModel2.data?.tasks?[index] ??
                              Tasks(),
                          /*onTap: () {
                          taskCubit.showSingleTask(index).whenComplete(
                            () {
                              Navigation.navigateToWithoutNavBar(
                                context,
                                EditAndDeleteTaskScreen(index: index),
                              );
                            },
                          );
                        },*/
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
