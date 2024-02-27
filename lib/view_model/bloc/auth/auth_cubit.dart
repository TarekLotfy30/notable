import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notable/view_model/data/local/shared_keys.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/data/remote/dio_helper.dart';
import 'package:notable/view_model/data/remote/endpoints.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isObscure = true;
  void changeIsObscure() {
    isObscure = !isObscure;
    emit(ChangeIsObscureState());
  }

  Future<void> login() async {
    emit(AuthLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.login,
      body: {
        //tareklotfi123@gmail.com
        //pass12345
        'email': emailController!.text,
        'password': passwordController!.text
      },
    ).then((value) {
      //If the server responds with a status code of 200 or 201
      //(which usually means that the request was successful),
      if (value?.statusCode == 200 || value?.statusCode == 201) {
        saveData(value?.data);
        print(value?.data["data"]["token"]);
        emit(AuthSuccessState());
      }
    }).catchError((onError) {
      //If there’s an error (for example, if the server is down or the user’s
      // internet connection is lost),
      log(onError.toString());
      emit(AuthErrorState(onError.toString()));
    });
  }

  void saveData(Map<String, dynamic>? value) {
    LocalData.set(key: AppSharedKeys.token, value: value?["data"]["token"]);
    LocalData.set(
        key: AppSharedKeys.userId, value: value?["data"]["user"]["id"]);
    LocalData.set(
        key: AppSharedKeys.email, value: value?["data"]["user"]["email"]);
    LocalData.set(
        key: AppSharedKeys.name, value: value?["data"]["user"]["name"]);
  }
}
