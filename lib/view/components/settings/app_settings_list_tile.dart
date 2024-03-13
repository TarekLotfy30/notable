import 'package:flutter/material.dart';
import 'package:notable/view/components/widgets/app_setting.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class AppSettingListTile extends StatelessWidget {
  const AppSettingListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "APP SETTINGS",
          style: TextStyles.font10Regular.copyWith(
            color: AppColors.darkGrayColor,
          ),
        ),
        verticalSpacing(25),
        const AppSetting(
          icon: Icons.lock_outline,
          text: "Change Password",
        ),
        const AppSetting(
          icon: Icons.text_fields_sharp,
          text: "Text Size",
        ),
        const AppSetting(
          icon: Icons.notifications_none_outlined,
          text: "Notifications",
        ),
        const AppSetting(
          icon: Icons.language,
          text: "Language",
        ),
        const AppSetting(
          icon: Icons.info_outline,
          text: "About",
        ),
      ],
    );
  }
}
