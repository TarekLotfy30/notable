part of "../../screens/auth/login/login_screen.dart";

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    super.key,
  });

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
        } else if (state is AuthErrorState) {
          // Handle login error
          showSnackBar(context, "the email or password is not correct",
              AppColors.errorColor);
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: state is! AuthLoadingState,
          replacement: const BuildCircularIndicator(),
          child: AppButton(
            onPressed: () async {
              if (AuthCubit.get(context).formKey.currentState!.validate()) {
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
