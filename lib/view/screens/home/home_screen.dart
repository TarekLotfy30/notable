import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/build_circular_indicator.dart';
import 'package:notable/view/components/widgets/task_card.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/images/images.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

import '../../../model/task/task.dart';

part "../../components/home_screen/build_empty_tasks.dart";
part "../../components/home_screen/build_tasks_list.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskCubit = TasksCubit.get(context);
    // Provide taskCubit to children and build UI
    return BlocProvider.value(
      value: taskCubit..getAllTasks(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Personal greeting
                Text(
                  "Hey! ${LocalData.get(key: AppSharedKeys.name)}",
                  style: TextStyles.font14Regular.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: AppColors.black,
                  ),
                ),
                verticalSpacing(4),
                Text(
                  "Let’s start making notes",
                  style: TextStyles.font12Regular.copyWith(
                    fontWeight: FontWeightHelper.light,
                    color: AppColors.black,
                  ),
                ),
                verticalSpacing(20),
                // Tasks list with loading and empty states
                BlocBuilder<TasksCubit, TasksState>(
                  builder: (context, state) {
                    return Visibility(
                      visible:
                          taskCubit.taskModel.data?.tasks?.isNotEmpty ?? false,
                      replacement: const _BuildEmptyTasks(),
                      child: Visibility(
                        visible: state is! TasksLoading,
                        replacement: const BuildCircularIndicator(),
                        child: _BuildTasksList(taskCubit: taskCubit),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
