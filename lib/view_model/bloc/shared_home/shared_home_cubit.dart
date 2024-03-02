import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notable/view/screens/create_new_task/select_note_type_screen.dart';
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
      const HomeScreen(),
      const FinishedScreen(),
      const SelectNoteType(),
      const SearchScreen(),
      const SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppImages.homeSolid,
            width: 24.w,
            height: 24.h,
          ),
          inactiveIcon: SvgPicture.asset(
            AppImages.homeSolid,
            colorFilter: ColorFilter.mode(
              AppColors.darkGrayColor,
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.h,
          ),
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.darkGrayColor,
          title: 'Home',
          textStyle: TextStyles.font10Regular,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppImages.finishedSolid,
            width: 24.w,
            height: 24.h,
          ),
          inactiveIcon: SvgPicture.asset(
            AppImages.finishedSolid,
            colorFilter: ColorFilter.mode(
              AppColors.darkGrayColor,
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.h,
          ),
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.darkGrayColor,
          title: 'Finished',
          textStyle: TextStyles.font10Regular,
        ),
        PersistentBottomNavBarItem(
          icon: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            maxRadius: 35.r,
            child: SvgPicture.asset(
              AppImages.add,
              width: 30.w,
              height: 30.h,
            ),
          ),
          activeColorPrimary: AppColors.whiteColor,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppImages.search,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          inactiveIcon: SvgPicture.asset(
            AppImages.search,
            colorFilter: ColorFilter.mode(
              AppColors.darkGrayColor,
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.h,
          ),
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.darkGrayColor,
          title: 'Search',
          textStyle: TextStyles.font10Regular,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppImages.settingsSolid,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          inactiveIcon: SvgPicture.asset(
            AppImages.settingsSolid,
            colorFilter: ColorFilter.mode(
              AppColors.darkGrayColor,
              BlendMode.srcIn,
            ),
            width: 24.w,
            height: 24.h,
          ),
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: AppColors.darkGrayColor,
          title: 'Home',
          textStyle: TextStyles.font10Regular,
        ),
      ];
}
