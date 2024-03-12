part of "../../../screens/auth/login/login_screen.dart";

class _CreateAccountLink extends StatelessWidget {
  const _CreateAccountLink();

  @override
  Widget build(BuildContext context) {
    // Provide an option for users who don't have an account yet
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyles.font14Regular.copyWith(
            color: AppColors.darknessGrayColor,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        // Navigate to RegisterScreen on button click
        TextButton(
          onPressed: () {
            Navigation.pushAndRemove(context, const RegisterScreen());
          },
          child: Text(
            "Create Now",
            style: TextStyles.font14Regular.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ],
    );
  }
}
