part of "../../../screens/auth/register/register_screen.dart";

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          // Navigate to home screen on successful login
          showSnackBar(
            context,
            "Registered successfully",
            AppColors.successColor,
          ).then(
            (value) => Navigation.pushAndRemove(
              context,
              const SharedHome(),
            ),
          );
        } else if (state is AuthErrorState) {
          showSnackBar(
            context,
            state.error,
            AppColors.errorColor,
          );
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: state is! AuthLoadingState,
          replacement: const BuildCircularIndicator(),
          child: AppButton(
            onPressed: () async {
              // Validate and submit login form
              // if validation passes
              // then call register()
              if (cubit.registerFormKey.currentState!.validate() &&
                  !cubit.showErrorMessage &&
                  cubit.isChecked) {
                cubit.register();
              } else {
                cubit.showErrorMessageFunc(false);
              }
            },
            buttonText: "Register",
            textStyle: TextStyles.font16Regular.copyWith(
              color: AppColors.lightPrimaryColor,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        );
      },
    );
  }
}
