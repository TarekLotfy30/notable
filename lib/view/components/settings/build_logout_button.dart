import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/screens/auth/login/login_screen.dart';
import 'package:notable/view_model/bloc/auth/auth_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class BuildLogoutButton extends StatelessWidget {
  const BuildLogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          showSnackBar(
            context,
            "Logout Successfully",
            AppColors.successColor,
          ).then((value) {
            Navigation.navigateToLoginScreen(
              context,
              const LoginScreen(),
            );
          });
        } else if (state is AuthErrorState) {
          showSnackBar(
            context,
            state.error.name,
            AppColors.errorColor,
          );
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            AuthCubit.get(context).signOut();
          },
          child: Row(
            children: [
              Icon(
                Icons.logout_rounded,
                color: AppColors.errorColor,
                size: 20.sp,
              ),
              horizontalSpacing(8),
              Text(
                "Log Out",
                style: TextStyles.font16Regular.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  color: AppColors.errorColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
