import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/app_button_widget.dart';
import 'package:notable/view/components/widgets/app_text_form_feild.dart';
import 'package:notable/view/screens/auth/register/register_screen.dart';
import 'package:notable/view/screens/shared_home/shared_home.dart';
import 'package:notable/view_model/bloc/auth/auth_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/images/images.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Form(
                key: AuthCubit.get(context).formKey,
                child: Column(
                  children: [
                    //buildHeader()
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
                    //
                    verticalSpacing(12),
                    //form
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
                    verticalSpacing(12),
                    AppTextFormField(
                      controller: AuthCubit.get(context).emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email"; ////"Invalid email address";
                        }
                        return null;
                      },
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {},
                      hintText: 'Example: johndoe@gmail.com',
                    ),
                    verticalSpacing(20),
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
                    verticalSpacing(12),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return AppTextFormField(
                          controller: AuthCubit.get(context).passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.send,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password"; ////"Invalid PASSWORD . Please try again";
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
                    //
                    verticalSpacing(22),
                    //submitButton
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccessState) {
                          Navigation.pushAndRemove(
                            context,
                            const SharedHome(),
                          );
                        }
                      },
                      builder: (context, state) {
                        return AppButton(
                          onPressed: () async {
                            if (AuthCubit.get(context)
                                .formKey
                                .currentState!
                                .validate()) {
                              AuthCubit.get(context).login();
                            }
                          },
                          buttonText: "Log In",
                          textStyle: TextStyles.font16Regular.copyWith(
                            color: AppColors.lightPrimaryColor,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        );
                      },
                    ),
                    verticalSpacing(12),
                    //SocialLoginButtons
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
                        Expanded(
                          child: RawChip(
                            onPressed: () {},
                            label: Text(
                              "Google",
                              style: TextStyles.font14Regular.copyWith(
                                color: AppColors.darknessGrayColor,
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                            backgroundColor: AppColors.lightGrayColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: AppColors.whiteColor,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                            avatar: Image.asset(
                              AppImages.google,
                              height: 17.h,
                              width: 17.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: RawChip(
                            onPressed: () {},
                            label: Text(
                              "Facebook",
                              style: TextStyles.font14Regular.copyWith(
                                color: AppColors.darknessGrayColor,
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                            backgroundColor: AppColors.lightGrayColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: AppColors.whiteColor,
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                            avatar: Image.asset(
                              AppImages.facebook,
                              height: 17.h,
                              width: 17.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    verticalSpacing(12),
                    //CreateAccountLink
                    const CreateAccountLink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateAccountLink extends StatelessWidget {
  const CreateAccountLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
