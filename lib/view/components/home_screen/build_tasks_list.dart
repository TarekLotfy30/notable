part of "../../screens/home/home_screen.dart";

class _BuildTasksList extends StatelessWidget {
  const _BuildTasksList({
    required this.taskCubit,
  });

  final TasksCubit taskCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) => TaskCard(
          task: taskCubit.taskModel.data?.tasks?[index] ?? Tasks(),
        ),
        separatorBuilder: (BuildContext context, int index) =>
            verticalSpacing(10),
        itemCount: taskCubit.taskModel.data?.tasks?.length ?? 0,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }
}
