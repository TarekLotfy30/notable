part of "../../../screens/auth/login/login_screen.dart";

class _SocialLoginButtons extends StatelessWidget {
  const _SocialLoginButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Informative text before social login buttons
        Text(
          "Or continue with",
          style: TextStyles.font14Regular.copyWith(
            color: AppColors.darknessGrayColor,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        verticalSpacing(12),
        Row(
          children: [
            // Expanded Google login button
            Expanded(
              child: SocialButton(
                icon: AppImages.google,
                text: "Google",
                onPressed: () {},
              ),
            ),
            // Expanded Facebook login button
            Expanded(
              child: SocialButton(
                icon: AppImages.facebook,
                text: "Facebook",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
