part of '../../screens/home/home_screen.dart';

class _BuildTasksList extends StatelessWidget {
  const _BuildTasksList({required this.taskCubit});

  final TasksCubit taskCubit;

  @override
  Widget build(BuildContext context) {
    // Extract tasks for clarity
    final tasks = taskCubit.taskModel.data?.tasks ?? [];
    return Expanded(
      child: ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (_, __) => verticalSpacing(10),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final task = tasks[index]; // Get task directly for each item
          return Slidable(
            key: UniqueKey(), // Use a more descriptive key
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.5,
              dismissible: DismissiblePane(
                onDismissed: () => taskCubit.deleteTask(index),
              ),
              children: [
                BuildSlidableAction(
                  backgroundColor: const Color(0xFFFE4A49),
                  icon: Icons.delete,
                  label: 'Delete',
                  onPressed: (context) => taskCubit.deleteTask(index),
                ),
                BuildSlidableAction(
                  backgroundColor: AppColors.successColor.withOpacity(0.7),
                  icon: Icons.done_outline,
                  label: 'Finished',
                  onPressed: (context) {
                    taskCubit.markAsFinished(index);
                    //taskCubit.deleteTask(index);
                  },
                ),
              ],
            ),
            child: TaskCard(
              task: task,
              onTap: () async {
                await taskCubit.showSingleTask(index);
                Navigation.navigateToWithoutNavBar(
                  context,
                  EditAndDeleteTaskScreen(index: index),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
