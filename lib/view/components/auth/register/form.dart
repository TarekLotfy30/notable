part of "../../../screens/auth/register/register_screen.dart";

class _BuildForm extends StatelessWidget {
  const _BuildForm({
    required this.cubit,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.registerFormKey,
      child: Column(
        children: [
          // Full Name
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Full Name",
              style: TextStyles.font16Regular.copyWith(
                color: AppColors.black,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
          AppTextFormField(
            validate: (value) {
              if (value.isEmpty) {
                return "The name field is required.";
              }
              return null;
            },
            controller: cubit.nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            hintText: 'Example:John Doe',
            maxLines: 1,
          ),
          verticalSpacing(15),
          // Email
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
          AppTextFormField(
            validate: (value) {
              if (value.isEmpty) {
                return 'Email field is required.';
              }
              if (!AppRegex.isEmailValid(value)) {
                return 'Invalid email format.';
              }
              return null;
            },
            controller: cubit.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            hintText: 'Example:johndoe@gmail.com',
            autoValidateMode: AutovalidateMode.onUserInteraction,
            maxLines: 1,
          ),
          verticalSpacing(15),
          // Password
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
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppTextFormField(
                onChanged: (value) {
                  cubit.validate(value);
                },
                controller: cubit.passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validate: (value) {
                  if (value.isEmpty) {
                    return "The password field is required.";
                  }
                  if (cubit.hasLowerCase == false) {
                    return "must contain at least one lowercase letter.";
                  }
                  if (cubit.hasUpperCase == false) {
                    return "must contain at least one uppercase letter.";
                  }
                  if (cubit.hasSpecialCharacter == false) {
                    return "must contain at least one special character.";
                  }
                  if (cubit.hasNumber == false) {
                    return "must contain at least one number.";
                  }
                  if (cubit.hasMinLength == false) {
                    return " must be at least 8 characters.";
                  }
                  if (cubit.hasMaxLength == false) {
                    return " must not exceed 20 characters.";
                  }
                  return null;
                },
                autoValidateMode: AutovalidateMode.onUserInteraction,
                hintText: '********',
                isObscureText: cubit.isObscure,
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changeIsObscure();
                  },
                  icon: Visibility(
                    visible: !cubit.isObscure,
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
          verticalSpacing(15),
          // Confirm Password
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Confirm Password",
              style: TextStyles.font16Regular.copyWith(
                color: AppColors.black,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppTextFormField(
                controller: cubit.confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Confirm Password field is required.';
                  }
                  if (cubit.passwordController.text != value) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
                autoValidateMode: AutovalidateMode.onUserInteraction,
                hintText: '********',
                isObscureText: cubit.isObscure,
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.changeIsObscure();
                  },
                  icon: Visibility(
                    visible: !cubit.isObscure,
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
