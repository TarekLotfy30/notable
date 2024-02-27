import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view/components/widgets/app_button_widget.dart';
import 'package:notable/view/components/widgets/app_text_form_field.dart';
import 'package:notable/view/components/widgets/build_circular_indicator.dart';
import 'package:notable/view/components/widgets/social_button.dart';
import 'package:notable/view/screens/auth/register/register_screen.dart';
import 'package:notable/view/screens/shared_home/shared_home.dart';
import 'package:notable/view_model/bloc/auth/auth_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/images/images.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

part '../../../components/auth/build_header.dart';
part '../../../components/auth/create_account_link.dart';
part '../../../components/auth/form.dart';
part '../../../components/auth/social_login_buttons.dart';
part '../../../components/auth/submit_button.dart';

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
              child: Column(
                children: [
                  // Display Image and login text
                  const _BuildHeader(),
                  // Add vertical spacing
                  verticalSpacing(12),
                  // Login form with email and password fields
                  const _BuildForm(),
                  // Add vertical spacing
                  verticalSpacing(22),
                  // Login button that triggers login logic
                  const _SubmitButton(),
                  // Add vertical spacing
                  verticalSpacing(12),
                  // Optional social login options
                  const _SocialLoginButtons(),
                  // Add vertical spacing
                  verticalSpacing(12),
                  // Option to create a new account
                  const _CreateAccountLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
