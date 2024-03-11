import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/app_button_widget.dart';
import 'package:notable/view/components/widgets/app_text_form_field.dart';
import 'package:notable/view/components/widgets/build_circular_indicator.dart';
import 'package:notable/view/screens/auth/login/login_screen.dart';
import 'package:notable/view/screens/shared_home/shared_home.dart';
import 'package:notable/view_model/bloc/auth/auth_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/helpers/app_regex.dart';
import 'package:notable/view_model/utils/images/images.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

part '../../../components/auth/register/already_have_an_account.dart';
part '../../../components/auth/register/build_header.dart';
part '../../../components/auth/register/form.dart';
part '../../../components/auth/register/submit_button.dart';
part '../../../components/auth/register/terms_and_conditions_checkbox.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = AuthCubit.get(context);
    authCubit.clearControllers();
    authCubit.isChecked = false;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              children: [
                // Display Image and sign up text
                const _BuildHeader(),
                // Add vertical spacing
                verticalSpacing(15),
                // Registration form with name,email,pass,confirm pass fields
                _BuildForm(cubit: authCubit),
                // Add vertical spacing
                verticalSpacing(15),
                // Terms and conditions checkbox using TermsAndConditionsCheckbox
                _TermsAndConditionsCheckbox(cubit: authCubit),
                // Add vertical spacing
                verticalSpacing(15),
                // Register button that triggers Register logic
                _SubmitButton(cubit: authCubit),
                // Add vertical spacing
                verticalSpacing(15),
                // Navigation to LoginScreen
                const _AlreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
