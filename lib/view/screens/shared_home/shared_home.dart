import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/bloc/shared_home/shared_home_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SharedHome extends StatelessWidget {
  const SharedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedHomeCubit cubit = SharedHomeCubit.get(context);
    return Scaffold(
      //appBar: const CustomAppBar(),
      body: PersistentTabView(
        context,
        navBarHeight: 84.h,
        controller: cubit.controller,
        screens: cubit.buildScreens(),
        items: cubit.navBarsItems(),
        confineInSafeArea: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        // Navigation Bar's items animation properties.
        resizeToAvoidBottomInset: true,
        margin: EdgeInsets.zero,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        // Screen transition animation on change of selected tab.
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: Duration(milliseconds: 200),
        ),
        //TODO:STYLE 13
        navBarStyle: NavBarStyle.style15,
        backgroundColor: AppColors.whiteColor,
        hideNavigationBarWhenKeyboardShows: true,
      ),
    );
  }
}

//el controller da el index beta3k ya3ni lw 3ayz terop7 mn page ly page tany kda
// TextButton(
//      onPressed: () {
//                SharedHomeCubit.get(context).controller.index = 1;
//            },
