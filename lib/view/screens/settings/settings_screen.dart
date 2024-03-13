import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notable/view/components/settings/app_settings_list_tile.dart';
import 'package:notable/view/components/settings/build_logout_button.dart';
import 'package:notable/view/components/settings/build_user_header.dart';
import 'package:notable/view/components/settings/edit_profile_button.dart';
import 'package:notable/view/components/widgets/build_app_divider.dart';
import 'package:notable/view_model/bloc/auth/auth_cubit.dart';
import 'package:notable/view_model/utils/functions/functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BuildUserHeader(),
                  verticalSpacing(25),
                  const EditProfileButton(),
                  verticalSpacing(25),
                  const BuildAppDivider(),
                  verticalSpacing(25),
                  const AppSettingListTile(),
                  verticalSpacing(20),
                  const BuildAppDivider(),
                  verticalSpacing(20),
                  const BuildLogoutButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
