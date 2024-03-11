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
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
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
    emailController!.clear();
    passwordController!.clear();
    nameController!.clear();
    confirmPasswordController!.clear();
  }

  Future<void> login() async {
    emit(AuthLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.login,
      body: {
        'email': emailController!.text,
        'password': passwordController!.text
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
      log(onError.toString());
      log(onError.response!.statusCode.toString());
      if (onError is DioException) {
        if (onError.response?.statusCode == 422) {
          emit(AuthErrorState(onError.response?.data["errors"]["email"][0]));
        } else if (onError.response?.statusCode == 401) {
          emit(AuthErrorState(onError.response?.data["message"]));
        } else {
          emit(AuthErrorState("An unexpected error occurred."));
        }
      } else {
        emit(AuthErrorState("An unexpected error occurred."));
      }
    });
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.register,
      body: {
        "name": nameController!.text,
        'email': emailController!.text,
        'password': passwordController!.text,
        'password_confirmation': confirmPasswordController!.text
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
        if (onError.response?.statusCode == 422) {
          emit(AuthErrorState(onError.response?.data["errors"]["email"][0]));
        } else if (onError.response?.statusCode == 401) {
          emit(AuthErrorState(onError.response?.data["message"]));
        } else {
          emit(AuthErrorState("An unexpected error occurred."));
        }
      } else {
        emit(AuthErrorState("An unexpected error occurred."));
      }
    });
  }
}
