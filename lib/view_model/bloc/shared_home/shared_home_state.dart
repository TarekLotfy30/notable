part of 'shared_home_cubit.dart';

@immutable
abstract class SharedHomeState {}

class SharedHomeInitial extends SharedHomeState {}

class ChangeBottomNavBarState extends SharedHomeState {}

class ChangeItemSelectedState extends SharedHomeState {}
