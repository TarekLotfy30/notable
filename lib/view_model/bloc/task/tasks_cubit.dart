import 'dart:convert';

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
  TaskModel taskModel2 = TaskModel();
  final formKey = GlobalKey<FormState>();

  //Text Editing Controllers
  TextEditingController initialTitleController = TextEditingController();
  TextEditingController initialDescriptionController = TextEditingController();
  TextEditingController initialFirstDateController = TextEditingController();
  TextEditingController initialLastDateController = TextEditingController();

  //Text Editing Controllers for Editing or Deleting
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController firstDateController = TextEditingController();
  TextEditingController lastDateController = TextEditingController();

  Future<void> getTasks() async {
    emit(TasksLoadingState());
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) => DioHelper.getData(
        endPoint: EndPoints.filterTasks,
        token: LocalData.get(key: AppSharedKeys.token),
        params: {"status": "new"},
      ).then((value) {
        taskModel = TaskModel.fromJson(
          value?.data,
          color: sendTheColor ?? AppColors.black,
        );
        emit(TaskLoadedSuccessfullyState());
      }).catchError((onError) {
        emit(TasksErrorState(onError.toString()));
      }),
    );
  }

  Future<void> sendTask() async {
    emit(SendTaskLoadingState());
    DioHelper.postData(
      endPoint: EndPoints.tasks,
      token: LocalData.get(key: AppSharedKeys.token),
      body: {
        "title": initialTitleController.text,
        "description": initialDescriptionController.text,
        "start_date": initialFirstDateController.text,
        "end_date": initialLastDateController.text,
        "status": "new",
      },
    ).then((value) {
      taskModel.data?.tasks?.add(Tasks.fromJson(
        value?.data["data"],
        color: sendTheColor ?? AppColors.black,
      ));
      emit(SendTaskLoadedSuccessfullyState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SendTaskErrorState(onError.toString()));
    });
  }

  Future<void> showSingleTask(int index) async {
    emit(ShowSingleTaskLoadingState());
    DioHelper.getData(
      endPoint: "${EndPoints.tasks}/${taskModel.data?.tasks?[index].id}",
      token: LocalData.get(key: AppSharedKeys.token),
    ).then((value) {
      initialTitleController.text = taskModel.data?.tasks?[index].title ?? "";
      initialDescriptionController.text =
          taskModel.data?.tasks?[index].description ?? "";
      initialFirstDateController.text =
          taskModel.data?.tasks?[index].startDate ?? "";
      initialLastDateController.text =
          taskModel.data?.tasks?[index].endDate ?? "";
      emit(ShowSingleTaskLoadedSuccessfullyState());
    }).catchError((onError) {
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
      reset();
      emit(DeleteTaskLoaded());
    }).catchError((onError) {
      emit(DeleteTaskError(onError.toString()));
    });
  }

  Future<void> updateTask(int index) async {
    final titleChanged =
        initialTitleController.text != taskModel.data?.tasks?[index].title;
    final descriptionChanged = initialDescriptionController.text !=
        taskModel.data?.tasks?[index].description;
    final firstDateChanged = initialFirstDateController.text !=
        taskModel.data?.tasks?[index].startDate;
    final lastDateChanged =
        initialLastDateController.text != taskModel.data?.tasks?[index].endDate;
    if (titleChanged ||
        descriptionChanged ||
        firstDateChanged ||
        lastDateChanged) {
      DioHelper.postData(
        endPoint: "${EndPoints.tasks}/${taskModel.data?.tasks?[index].id}",
        token: LocalData.get(key: AppSharedKeys.token),
        body: {
          "_method": "PUT",
          "title": initialTitleController.text,
          "description": initialDescriptionController.text,
          "start_date": initialFirstDateController.text,
          "end_date": initialLastDateController.text,
          "status": "new",
        },
      ).then((value) {
        taskModel.data?.tasks?[index].title = initialTitleController.text;
        taskModel.data?.tasks?[index].description =
            initialDescriptionController.text;
        taskModel.data?.tasks?[index].startDate =
            initialFirstDateController.text;
        taskModel.data?.tasks?[index].endDate = initialLastDateController.text;
        emit(UpdateTaskLoaded());
      }).catchError((onError) {
        emit(UpdateTaskError(onError.toString()));
      });
    } else {
      emit(UpdateTaskWarning());
    }
  }

  Future<void> markAsFinished(int index) async {
    emit(MarkAsFinishedLoading());
    DioHelper.postData(
      endPoint: "${EndPoints.tasks}/${taskModel.data?.tasks?[index].id}",
      token: LocalData.get(key: AppSharedKeys.token),
      body: {
        "_method": "PUT",
        "title": "sdf",
        "description": "dastard",
        "start_date": "2022-03-20",
        "end_date": "2022-03-20",
        "status": "compeleted"
      },
    ).then((value) {
      if (value?.statusCode == 200) {
        print(json.encode(value?.data));
      }
      emit(MarkAsFinishedLoaded());
    }).catchError((onError) {
      print(onError.toString());
      emit(MarkAsFinishedError(onError.toString()));
    });
  }

  Future<void> getFinishedTasks() async {
    emit(GetFinishedTasksLoading());
    await Future.delayed(const Duration(seconds: 1)).then(
      (value) => DioHelper.getData(
        endPoint: EndPoints.filterTasks,
        token: LocalData.get(key: AppSharedKeys.token),
        params: {"status": "compeleted"},
      ).then((value) {
        print("${value?.data}");
        taskModel2 = TaskModel.fromJson(
          value?.data,
          color: sendTheColor ?? AppColors.black,
        );
        print("${taskModel2.data?.tasks?.length}");
        emit(GetFinishedTasksLoaded());
      }).catchError((onError) {
        emit(GetFinishedTasksError(onError.toString()));
      }),
    );
  }

  void reset() {
    initialTitleController.clear();
    initialDescriptionController.clear();
    initialFirstDateController.clear();
    initialLastDateController.clear();
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
  Color? sendTheColor;

  void selectedCategoryIndex(int index) {
    categoryIndex = index;
    selectColor();
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

  @override
  Future<void> close() async {
    initialTitleController.dispose();
    initialDescriptionController.dispose();
    initialFirstDateController.dispose();
    initialLastDateController.dispose();
    return super.close();
  }
}
