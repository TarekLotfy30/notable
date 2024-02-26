import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/screens/splash/splash_screen.dart';
import 'package:notable/view_model/bloc/auth/auth_cubit.dart';
import 'package:notable/view_model/bloc/shared_home/shared_home_cubit.dart';
import 'package:notable/view_model/utils/themes/app_theme.dart';

class NotableApp extends StatelessWidget {
  const NotableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => SharedHomeCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
