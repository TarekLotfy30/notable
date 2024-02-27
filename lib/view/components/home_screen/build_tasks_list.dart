import 'package:flutter/material.dart';
import 'package:notable/model/task/task.dart';
import 'package:notable/view/components/widgets/task_card.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/functions/functions.dart';

class BuildTasksList extends StatelessWidget {
  const BuildTasksList({
    super.key,
    required this.taskCubit,
  });

  final TasksCubit taskCubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => TaskCard(
        task: taskCubit.taskModel.data?.tasks?[index] ?? Tasks(),
      ),
      separatorBuilder: (BuildContext context, int index) =>
          verticalSpacing(10),
      itemCount: taskCubit.taskModel.data?.tasks?.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
