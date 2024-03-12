part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final AuthError error;

  AuthErrorState(this.error);
}

class ValidateState extends AuthState {}

class ChangeAutoValidateModeState extends AuthState {}

class ChangeIsCheckedState extends AuthState {}

class ChangeIsObscureState extends AuthState {}

class ShowErrorMessageState extends AuthState {}
