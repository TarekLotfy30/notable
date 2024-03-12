part of "../../../screens/auth/login/login_screen.dart";

class _BuildForm extends StatelessWidget {
  const _BuildForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AuthCubit.get(context).loginFormKey,
      child: Column(
        children: [
          // Align with "Email" text label
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Email",
              style: TextStyles.font16Regular.copyWith(
                color: AppColors.black,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
          // Vertical spacing (if needed)
          verticalSpacing(12),
          // AppTextFormField with email controller
          AppTextFormField(
            controller: AuthCubit.get(context).emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validate: (value) {
              if (value.isEmpty) {
                return 'Email field is required.';
              }
              if (!AppRegex.isEmailValid(value)) {
                return 'Invalid email format.';
              }
              return null;
            },
            hintText: 'Example: johndoe@gmail.com',
            maxLines: 1,
          ),
          // Vertical spacing
          verticalSpacing(20),
          // Align with "Password" text label
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Password",
              style: TextStyles.font16Regular.copyWith(
                color: AppColors.black,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
          // Vertical spacing
          verticalSpacing(12),
          // BlocBuilder for AppTextFormField with password controller
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppTextFormField(
                controller: AuthCubit.get(context).passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Password field is required.';
                  }
                  if (!AppRegex.isPasswordValid(value)) {
                    return 'The password is not valid';
                  }
                  return null;
                },
                hintText: '********',
                isObscureText: AuthCubit.get(context).isObscure,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                suffixIcon: IconButton(
                  onPressed: () {
                    AuthCubit.get(context).changeIsObscure();
                  },
                  icon: Visibility(
                    visible: !AuthCubit.get(context).isObscure,
                    replacement: Icon(
                      Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                    child: Icon(
                      Icons.visibility,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                maxLines: 1,
              );
            },
          ),
        ],
      ),
    );
  }
}
