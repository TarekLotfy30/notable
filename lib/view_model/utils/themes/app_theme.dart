import 'package:flutter/material.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';

class AppTheme {
  static ThemeData get lightMode => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: "SF-UI-Display",
        colorScheme: ColorScheme.fromSeed(
          // The overall brightness of the scheme.
          brightness: Brightness.light,
          // The base color for the scheme.
          seedColor: AppColors.primaryColor,
          // The default color that should be used for widgets like AppBar.
          primary: AppColors.primaryColor,
          // The color to use for text and icons on top of the primary color.
          onPrimary: AppColors.whiteColor,
          // An accent color that should stand out.
          secondary: AppColors.secondaryColor,
          // The color to use for text and icons on top of the secondary color.
          onSecondary: AppColors.whiteColor,
          // The color to use for error states in the application.
          error: AppColors.errorColor,
          // The color to use for text and icons on top of the error color.
          onError: AppColors.whiteColor,

          // The color to use for the background of the application.
          background: Colors.white,
          // The color to use for text and icons on top of the background color.
          onBackground: Colors.black,
          // The color to use for surfaces in the application.
          surface: Colors.white,
          // The color to use for text and icons on top of the surface color.
          onSurface: Colors.black,
          // The color to use for tertiary elements in the application.
          tertiary: Colors.deepPurple,
          // The color to use for text and icons on top of the tertiary color.
          onTertiary: Colors.white,
          // The color to use for outlines in the application.
          outline: Colors.black,
          // A variant of the outline color.
          outlineVariant: Colors.black,
          // The color to use for text and icons on top of the surface variant color
          onSurfaceVariant: Colors.black,
          // The color to use for text and icons on top of the inverse surface color
          onInverseSurface: Colors.black,
          // The color to use for shadows in the application.
          shadow: Colors.black,
          // A tint of the surface color.
          surfaceTint: Colors.deepPurple,
          // A variant of the surface color.
          surfaceVariant: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}
