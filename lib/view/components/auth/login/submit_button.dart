part of "../../../screens/auth/login/login_screen.dart";

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    // Extract button text and style for better maintainability
    const loginText = 'Log In';
    final loginStyle = TextStyles.font16Regular.copyWith(
      color: AppColors.lightPrimaryColor,
      fontWeight: FontWeightHelper.bold,
    );

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          // Navigate to home screen on successful login
          showSnackBar(
            context,
            "Logged in successfully",
            AppColors.successColor,
          ).then(
            (value) => Navigation.pushAndRemove(
              context,
              const SharedHome(),
            ),
          );
          SharedHomeCubit.get(context).controller.jumpToTab(0);
        } else if (state is AuthErrorState) {
          showSnackBar(
            context,
            state.error.name,
            AppColors.errorColor,
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: state is! AuthLoadingState,
          replacement: const BuildCircularIndicator(),
          child: AppButton(
            sideBorder: BorderSide.none,
            onPressed: () async {
              // Validate and submit login form
              // if validation passes
              // then call login()
              if (AuthCubit.get(context)
                  .loginFormKey
                  .currentState!
                  .validate()) {
                AuthCubit.get(context).login();
              }
            },
            buttonText: loginText,
            textStyle: loginStyle,
          ),
        );
      },
    );
  }
}
