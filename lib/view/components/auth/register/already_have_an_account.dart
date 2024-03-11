part of "../../../screens/auth/register/register_screen.dart";

class _AlreadyHaveAnAccount extends StatelessWidget {
  const _AlreadyHaveAnAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ? ",
          style: TextStyles.font14Regular.copyWith(
            color: AppColors.darknessGrayColor,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        // Navigate to RegisterScreen on button click
        TextButton(
          onPressed: () {
            Navigation.pushAndRemove(context, const LoginScreen());
          },
          child: Text(
            "Login Now",
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
