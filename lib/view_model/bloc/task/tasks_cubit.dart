import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notable/model/task/task.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/data/remote/dio_helper.dart';
import 'package:notable/view_model/data/remote/endpoints.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  static TasksCubit get(context) => BlocProvider.of(context);

  TaskModel taskModel = TaskModel();
  Future<void> getAllTasks() async {
    emit(TasksLoading());
    DioHelper.getData(
      endPoint: EndPoints.tasks,
      token: LocalData.get(key: AppSharedKeys.token),
    ).then((value) {
      taskModel = TaskModel.fromJson(value?.data);
      print(value?.data);
      emit(TasksLoaded());
    }).catchError((onError) {
      print(onError.toString());
      emit(TasksError(onError.toString()));
    });
  }
}
