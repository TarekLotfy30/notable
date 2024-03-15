import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notable/model/add_task/category.dart';
import 'package:notable/model/task/task.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/data/remote/dio_helper.dart';
import 'package:notable/view_model/data/remote/endpoints.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/images/images.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  static TasksCubit get(context) => BlocProvider.of(context);

  TaskModel taskModel = TaskModel();

  Future<void> getAllTasks() async {
    emit(TasksLoadingState());
    await Future.delayed(const Duration(seconds: 1))
        .then((value) => DioHelper.getData(
              endPoint: EndPoints.tasks,
              token: LocalData.get(key: AppSharedKeys.token),
            ).then((value) {
              taskModel = TaskModel.fromJson(value?.data);
              emit(TaskLoadedSuccessfullyState());
            }).catchError((onError) {
              print(onError.toString());
              emit(TasksErrorState(onError.toString()));
            }));
  }

  List<Category> categories = [
    Category(
      title: "Interesting Idea",
      subtitle: "Use free text area, feel free to write it all",
      icon: AppImages.lightBulb,
      cardBackgroundColor: AppColors.darkPrimaryColor,
      iconBackgroundColor: AppColors.primaryColor,
    ),
    Category(
      title: "Buying Something",
      subtitle: "Use Checklist, so you won't miss anything",
      icon: AppImages.shoppingCart,
      cardBackgroundColor: AppColors.darkSuccessColor,
      iconBackgroundColor: AppColors.successColor,
    ),
    Category(
      title: "Goals",
      subtitle: "Near/future goals, notes and keep focus",
      icon: AppImages.sparkles,
      cardBackgroundColor: AppColors.darkWarningColor,
      iconBackgroundColor: AppColors.warningColor,
    ),
    Category(
      title: "Guidance",
      subtitle: "Create guidance for routine activates",
      icon: AppImages.clipboardList,
      cardBackgroundColor: AppColors.darkErrorColor,
      iconBackgroundColor: AppColors.errorColor,
    ),
    Category(
      title: "Routine Tasks",
      subtitle: "Checklist with sub-checklist",
      icon: AppImages.clipboard,
      cardBackgroundColor: AppColors.darkSecondaryColor,
      iconBackgroundColor: AppColors.secondaryColor,
    ),
  ];

  int categoryIndex = 0;
  Color sendTheColor = AppColors.primaryColor;

  void selectedCategoryIndex(int index) {
    categoryIndex = index;
    selectColor();
    print("from cubit $categoryIndex");
    print("from cubit $sendTheColor");
    emit(SelectTheCategoryState());
  }

  void selectColor() {
    switch (categoryIndex) {
      case 0:
        sendTheColor = AppColors.primaryColor;
        break;
      case 1:
        sendTheColor = AppColors.successColor;
        break;
      case 2:
        sendTheColor = AppColors.warningColor;
        break;
      case 3:
        sendTheColor = AppColors.errorColor;
        break;
      case 4:
        sendTheColor = AppColors.secondaryColor;
        break;
      default:
        sendTheColor = AppColors.primaryColor;
        break;
    }
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController? titleController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();
  TextEditingController? firstDateController = TextEditingController();
  TextEditingController? lastDateController = TextEditingController();

  Future<void> sendTask() async {
    emit(SendTaskLoadingState());
    DioHelper.postData(
      endPoint: EndPoints.tasks,
      token: LocalData.get(key: AppSharedKeys.token),
      body: {
        "title": titleController?.text,
        "description": descriptionController?.text,
        "start_date": firstDateController?.text,
        "end_date": lastDateController?.text,
        "status": "new",
      },
    ).then((value) {
      taskModel.data?.tasks?.add(Tasks.fromJson(value?.data["data"]));
      emit(SendTaskLoadedSuccessfullyState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SendTaskErrorState(onError.toString()));
    });
  }

  void reset() {
    titleController?.clear();
    descriptionController?.clear();
    firstDateController?.clear();
    lastDateController?.clear();
  }

  Future<void> showSingleTask(int index) async {
    emit(ShowSingleTaskLoadingState());
    DioHelper.getData(
      endPoint: "${EndPoints.tasks}/${taskModel.data?.tasks?[index].id}",
      token: LocalData.get(key: AppSharedKeys.token),
    ).then((value) {
      print(value?.data);
      titleController?.text = taskModel.data?.tasks?[index].title ?? "";
      descriptionController?.text =
          taskModel.data?.tasks?[index].description ?? "";
      firstDateController?.text = taskModel.data?.tasks?[index].startDate ?? "";
      lastDateController?.text = taskModel.data?.tasks?[index].endDate ?? "";
      emit(ShowSingleTaskLoadedSuccessfullyState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShowSingleTaskErrorState(onError.toString()));
    });
  }

  Future<void> deleteTask(int index) async {
    emit(DeleteTaskLoading());
    DioHelper.deleteData(
      endPoint: "${EndPoints.tasks}/${taskModel.data?.tasks?[index].id}",
      token: LocalData.get(key: AppSharedKeys.token),
    ).then((value) {
      taskModel.data?.tasks?.remove(taskModel.data?.tasks?[index]);
      emit(DeleteTaskLoaded());
    }).catchError((onError) {
      print(onError.toString());
      emit(DeleteTaskError(onError.toString()));
    });
  }

  Future<void> updateTask(int index) async {
    emit(UpdateTaskLoading());
    DioHelper.postData(
      endPoint: "${EndPoints.tasks}/${taskModel.data?.tasks?[index].id}",
      token: LocalData.get(key: AppSharedKeys.token),
      body: {
        "_method": "PUT",
        "title": titleController?.text,
        "description": descriptionController?.text,
        "start_date": firstDateController?.text,
        "end_date": lastDateController?.text,
        "status": "new",
      },
    ).then((value) {
      taskModel.data?.tasks?[index].title = titleController?.text;
      taskModel.data?.tasks?[index].description = descriptionController?.text;
      taskModel.data?.tasks?[index].startDate = firstDateController?.text;
      taskModel.data?.tasks?[index].endDate = lastDateController?.text;
      emit(UpdateTaskLoaded());
    }).catchError((onError) {
      print(onError.toString());
      emit(UpdateTaskError(onError.toString()));
    });
  }
}
