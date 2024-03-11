part of 'tasks_cubit.dart';

abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {}

class TasksError extends TasksState {
  final String error;

  TasksError(this.error);
}

class SelectTheCategoryState extends TasksState {}

class SendTaskLoading extends TasksState {}

class SendTaskLoaded extends TasksState {}

class SendTaskError extends TasksState {
  final String error;

  SendTaskError(this.error);
}

class ShowSingleTaskLoading extends TasksState {}

class ShowSingleTaskLoaded extends TasksState {}

class ShowSingleTaskError extends TasksState {
  final String error;

  ShowSingleTaskError(this.error);
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
