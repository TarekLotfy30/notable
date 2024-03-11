part of "../../../screens/auth/register/register_screen.dart";

class _TermsAndConditionsCheckbox extends StatelessWidget {
  const _TermsAndConditionsCheckbox({
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return CheckboxListTile(
              title: Text(
                "I agree to all terms of use and Privacy Policy",
                style: TextStyles.font12Regular.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeightHelper.light,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: cubit.isChecked,
              onChanged: (value) {
                cubit.showErrorMessageFunc(value!);
                cubit.changeIsChecked(value);
              },
              activeColor: AppColors.primaryColor,
              dense: true,
              autofocus: true,
              isError: cubit.isChecked,
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
              checkColor: Colors.white,
            );
          },
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Visibility(
              visible: cubit.showErrorMessage,
              replacement: Container(),
              child: Visibility(
                visible: !cubit.isChecked,
                replacement: Container(),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Please accept the terms and conditions to proceed'
                    '...',
                    style: TextStyles.font10Regular.copyWith(
                      color: AppColors.errorColor,
                      fontWeight: FontWeightHelper.light,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
