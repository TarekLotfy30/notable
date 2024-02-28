part of "../../screens/auth/login/login_screen.dart";

class _BuildForm extends StatelessWidget {
  const _BuildForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AuthCubit.get(context).formKey,
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
            validate: (value) {
              if (value!.isEmpty) {
                return "Please enter email";
              }
              return null;
            },
            autoValidateMode: AutovalidateMode.onUserInteraction,
            hintText: 'Example: johndoe@gmail.com',
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
                  if (value!.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
                autoValidateMode: AutovalidateMode.onUserInteraction,
                hintText: '********',
                isObscureText: AuthCubit.get(context).isObscure,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
