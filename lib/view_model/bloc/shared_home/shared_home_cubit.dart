import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notable/view/screens/finished/finished_screen.dart';
import 'package:notable/view/screens/home/home_screen.dart';
import 'package:notable/view/screens/search/search_screen.dart';
import 'package:notable/view/screens/settings/settings_screen.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/images/images.dart';

part 'shared_home_state.dart';

class SharedHomeCubit extends Cubit<SharedHomeState> {
  SharedHomeCubit() : super(SharedHomeInitial());

  static SharedHomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeScreen(),
    const FinishedScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          AppImages.homeSolid,
          colorFilter:
              ColorFilter.mode(AppColors.darkGrayColor, BlendMode.srcIn),
          width: 30.w,
          height: 30.w,
        ),
      ),
      label: "Home",
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          AppImages.homeSolid,
          colorFilter:
              ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          width: 30.w,
          height: 30.w,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          AppImages.finished,
          colorFilter:
              ColorFilter.mode(AppColors.darkGrayColor, BlendMode.srcIn),
          width: 32.w,
          height: 32.w,
        ),
      ),
      label: "Finished",
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          AppImages.finishedSolid,
          colorFilter:
              ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          width: 32.w,
          height: 32.w,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          AppImages.search,
          colorFilter:
              ColorFilter.mode(AppColors.darkGrayColor, BlendMode.srcIn),
          width: 32.w,
          height: 32.w,
        ),
      ),
      label: "Search",
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          AppImages.search,
          colorFilter:
              ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          width: 32.w,
          height: 32.w,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          AppImages.settings,
          colorFilter:
              ColorFilter.mode(AppColors.darkGrayColor, BlendMode.srcIn),
          width: 32.w,
          height: 32.w,
        ),
      ),
      label: "Settings",
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          AppImages.settingsSolid,
          colorFilter:
              ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          width: 32.w,
          height: 32.w,
        ),
      ),
    ),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

/*  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      const HomeScreen(),
      const AllNewsScreen(),
      const CategoryScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppImages.homeIcon,
          width: 30,
          height: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.homeIcon,
          color: AppColors.lighterGray,
          width: 30,
          height: 30,
        ),
        activeColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppImages.allNewsIcon,
          width: 30,
          height: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.allNewsIcon,
          color: AppColors.lighterGray,
          width: 30,
          height: 30,
        ),
        activeColorPrimary: AppColors.primary,

      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppImages.categoryIcon,
          width: 30,
          height: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.categoryIcon,
          color: AppColors.lighterGray,
          width: 30,
          height: 30,
        ),
        activeColorPrimary: AppColors.primary,

      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppImages.profileIcon,
          width: 30,
          height: 30,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.profileIcon,
          color: AppColors.lighterGray,
          width: 30,
          height: 30,
        ),
        activeColorPrimary: AppColors.primary,

      ),
    ];
  }*/
}
