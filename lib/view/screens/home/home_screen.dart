import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notable/view/components/home_screen/build_slidable_action.dart';
import 'package:notable/view/components/home_screen/greeting_section.dart';
import 'package:notable/view/components/widgets/shimmer_widget.dart';
import 'package:notable/view/components/widgets/task_card.dart';
import 'package:notable/view/screens/edit_and_delete_task/edit_and_delete_task_screen.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/images/images.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

part '../../components/home_screen/build_empty_tasks.dart';
part '../../components/home_screen/build_tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskCubit = TasksCubit.get(context);
    return BlocProvider.value(
      value: taskCubit..getTasks(),
      child: HomeScreenContent(taskCubit: taskCubit),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    super.key,
    required this.taskCubit,
  });

  final TasksCubit taskCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingSection(),
              verticalSpacing(20),
              BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  return taskCubit.taskModel.data?.tasks?.isEmpty == true
                      ? const _BuildEmptyTasks()
                      : Visibility(
                          visible: state is! TasksLoadingState,
                          replacement: const ShimmerWidget(),
                          child: _BuildTasksList(taskCubit: taskCubit),
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
