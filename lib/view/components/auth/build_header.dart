part of "../../screens/auth/login/login_screen.dart";

class _BuildHeader extends StatelessWidget {
  const _BuildHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.login,
          height: 230.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyles.font32Regular.copyWith(
            color: AppColors.black,
            fontWeight: FontWeightHelper.extraBold,
          ),
        ),
      ],
    );
  }
}
