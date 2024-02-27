part of 'tasks_cubit.dart';

abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {}

class TasksError extends TasksState {
  final String error;
  TasksError(this.error);
}
