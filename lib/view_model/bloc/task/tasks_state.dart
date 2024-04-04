part of 'tasks_cubit.dart';

abstract class TasksState {}

class TasksInitial extends TasksState {}

class SelectTheCategoryState extends TasksState {}

class TasksLoadingState extends TasksState {}

class TaskLoadedSuccessfullyState extends TasksState {}

class TasksErrorState extends TasksState {
  final String error;

  TasksErrorState(this.error);
}

class SendTaskLoadingState extends TasksState {}

class SendTaskLoadedSuccessfullyState extends TasksState {}

class SendTaskErrorState extends TasksState {
  final String error;

  SendTaskErrorState(this.error);
}

class ShowSingleTaskLoadingState extends TasksState {}

class ShowSingleTaskLoadedSuccessfullyState extends TasksState {}

class ShowSingleTaskErrorState extends TasksState {
  final String error;

  ShowSingleTaskErrorState(this.error);
}

class DeleteTaskLoading extends TasksState {}

class DeleteTaskLoaded extends TasksState {}

class DeleteTaskError extends TasksState {
  final String error;

  DeleteTaskError(this.error);
}

class UpdateTaskLoading extends TasksState {}

class UpdateTaskLoaded extends TasksState {}

class UpdateTaskError extends TasksState {
  final String error;

  UpdateTaskError(this.error);
}

class UpdateTaskWarning extends TasksState {}

class MarkAsFinishedLoading extends TasksState {}

class MarkAsFinishedLoaded extends TasksState {}

class MarkAsFinishedError extends TasksState {
  final String error;

  MarkAsFinishedError(this.error);
}

class GetFinishedTasksLoading extends TasksState {}

class GetFinishedTasksLoaded extends TasksState {}

class GetFinishedTasksError extends TasksState {
  final String error;

  GetFinishedTasksError(this.error);
}
