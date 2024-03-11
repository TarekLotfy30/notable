part of "../../../screens/auth/register/register_screen.dart";

class _BuildHeader extends StatelessWidget {
  const _BuildHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.signup,
          height: 260.h,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Text(
          "Sign Up",
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
