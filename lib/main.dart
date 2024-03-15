import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notable/notable_app.dart';
import 'package:notable/view_model/bloc/observer.dart';
import 'package:notable/view_model/data/local/shared_preferences.dart';
import 'package:notable/view_model/data/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await LocalData.init();
  DioHelper.init();
  // LocalData.clearAllData();
  runApp(const NotableApp());
}
