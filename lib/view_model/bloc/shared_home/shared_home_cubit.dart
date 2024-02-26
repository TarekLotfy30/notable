import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notable/view/screens/add_task/add_task.dart';
import 'package:notable/view/screens/finished/finished_screen.dart';
import 'package:notable/view/screens/home/home_screen.dart';
import 'package:notable/view/screens/search/search_screen.dart';
import 'package:notable/view/screens/settings/settings_screen.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/images/images.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

part 'shared_home_state.dart';

class SharedHomeCubit extends Cubit<SharedHomeState> {
  SharedHomeCubit() : super(SharedHomeInitial());

  static SharedHomeCubit get(context) => BlocProvider.of(context);

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      FinishedScreen(),
      AddTask(),
      SearchScreen(),
      SettingsScreen(),
    ];
  }

  PersistentBottomNavBarItem navBarItem({
    required String title,
    required String iconPath,
    bool addButton = false,
  }) {
    return PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        iconPath,
        width: addButton ? 30.h : 24.w,
        height: addButton ? 30.h : 24.h,
        colorFilter: ColorFilter.mode(
          addButton ? AppColors.whiteColor : AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
      inactiveIcon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          addButton ? AppColors.whiteColor : AppColors.darkGrayColor,
          BlendMode.srcIn,
        ),
        width: addButton ? 30.w : 24.w,
        height: addButton ? 30.h : 24.h,
      ),
      activeColorPrimary: AppColors.primaryColor,
      inactiveColorPrimary: AppColors.darkGrayColor,
      title: addButton ? "" : title,
      textStyle: TextStyles.font10Regular,
    );
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      navBarItem(title: 'Home', iconPath: AppImages.homeSolid),
      navBarItem(title: 'Finished', iconPath: AppImages.finishedSolid),
      navBarItem(title: 'Add', iconPath: AppImages.add, addButton: true),
      navBarItem(title: 'Search', iconPath: AppImages.search),
      navBarItem(title: 'Settings', iconPath: AppImages.settingsSolid),
    ];
  }
}
