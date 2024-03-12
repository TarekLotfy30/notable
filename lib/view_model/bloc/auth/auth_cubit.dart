import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/data/remote/dio_helper.dart';
import 'package:notable/view_model/data/remote/endpoints.dart';
import 'package:notable/view_model/utils/helpers/app_regex.dart';

part 'auth_state.dart';

/*
An AuthError enum is introduced to categorize different error types.
The handleDioError method parses the DioException response and maps
it to appropriate AuthError types (e.g., emailAlreadyExists, unauthenticated).
In login and register, the catchError block emits AuthErrorState with the
mapped error type.
*/

enum AuthError {
  unexpected,
  invalidEmail,
  invalidPassword,
  emailAlreadyExists,
  unauthenticated,
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  bool showErrorMessage = false;
  bool isChecked = false;
  bool isObscure = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool hasMaxLength = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  var loginFormKey = GlobalKey<FormState>();
  var registerFormKey = GlobalKey<FormState>();

  void saveData(Map<String, dynamic>? value) {
    LocalData.set(key: AppSharedKeys.token, value: value?["data"]["token"]);
    LocalData.set(
        key: AppSharedKeys.userId, value: value?["data"]["user"]["id"]);
    LocalData.set(
        key: AppSharedKeys.email, value: value?["data"]["user"]["email"]);
    LocalData.set(
        key: AppSharedKeys.name, value: value?["data"]["user"]["name"]);
  }

  void changeIsObscure() {
    isObscure = !isObscure;
    emit(ChangeIsObscureState());
  }

  void showErrorMessageFunc(bool value) {
    showErrorMessage = !value;
    emit(ShowErrorMessageState());
  }

  void changeIsChecked(bool value) {
    isChecked = !isChecked;
    emit(ChangeIsCheckedState());
  }

  void validate(String value) {
    hasLowerCase = AppRegex.hasLowerCase(value);
    hasUpperCase = AppRegex.hasUpperCase(value);
    hasSpecialCharacter = AppRegex.hasSpecialCharacter(value);
    hasNumber = AppRegex.hasNumber(value);
    hasMinLength = AppRegex.hasMinLength(value);
    hasMaxLength = AppRegex.hasMaxLength(value);
    emit(ValidateState());
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    confirmPasswordController.clear();
  }

  AuthError handleDioError(DioException error) {
    if (error.response?.statusCode == 422) {
      final errorData = error.response?.data;
      if (errorData?["errors"]?["email"]?.isNotEmpty == true) {
        return AuthError.invalidEmail;
      }
    } else if (error.response?.statusCode == 401) {
      return AuthError.unauthenticated;
    }
    return AuthError.unexpected;
  }

  Future<void> login() async {
    final email = emailController.text;
    final password = utf8.encode(passwordController.text); // Hash

    emit(AuthLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.login,
      body: {
        'email': email,
        'password': base64Encode(password),
      },
    ).then((value) {
      //If the server responds with a status code of 200 or 201
      //(which usually means that the request was successful),
      if (value?.statusCode == 200 || value?.statusCode == 201) {
        saveData(value?.data);
        emit(AuthSuccessState());
      }
    }).catchError((onError) {
      //If there’s an error (for example, if the server is down or the user’s
      // internet connection is lost),
      // Handle Dio errors or network-related issues

      if (onError is DioException) {
        final error = handleDioError(onError);
        emit(AuthErrorState(error));
      } else {
        emit(AuthErrorState(AuthError.unexpected)); // Close unexpected error state
      }
    });
  }

  Future<void> register() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = utf8.encode(passwordController.text); // Hash password
    final confirmPassword = utf8.encode(confirmPasswordController.text); // Hash confirm password

    emit(AuthLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.register,
      body: {
        "name": name,
        'email': email,
        'password': base64Encode(password),
        'password_confirmation': base64Encode(confirmPassword),
      },
    ).then((value) {
      //If the server responds with a status code of 200 or 201
      //(which usually means that the request was successful),
      if (value?.statusCode == 200 || value?.statusCode == 201) {
        saveData(value?.data);
        emit(AuthSuccessState());
      }
    }).catchError((onError) {
      //If there’s an error (for example, if the server is down or the user’s
      // internet connection is lost),
      log(onError.toString());
      if (onError is DioException) {
        final error = handleDioError(onError);
        emit(AuthErrorState(error));
      } else {
        emit(AuthErrorState(AuthError.unexpected));
      }

  }
}
