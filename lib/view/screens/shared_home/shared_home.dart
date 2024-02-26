import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/bloc/shared_home/shared_home_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class SharedHome extends StatelessWidget {
  const SharedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedHomeCubit cubit = SharedHomeCubit.get(context);
    return BlocBuilder<SharedHomeCubit, SharedHomeState>(
      builder: (context, state) {
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            selectedLabelStyle: TextStyles.font12Regular.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            unselectedItemColor: AppColors.darkGrayColor,
            unselectedLabelStyle: TextStyles.font12Regular.copyWith(
              color: AppColors.darkGrayColor,
            ),
            elevation: 0,
            backgroundColor: AppColors.whiteColor,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            shape: const CircleBorder(),
            child: Icon(
              Icons.add,
              color: AppColors.whiteColor,
              size: 50.w,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
