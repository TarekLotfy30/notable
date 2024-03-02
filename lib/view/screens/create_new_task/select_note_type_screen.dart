import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notable/view/components/widgets/build_category_card.dart';
import 'package:notable/view/screens/create_new_task/task_details_screen.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/navigation/navigation.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class SelectNoteType extends StatelessWidget {
  const SelectNoteType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade50,
        elevation: 0,
        title: const Text("New Notes"),
        titleTextStyle: TextStyles.font16Regular.copyWith(
          color: AppColors.black,
          fontWeight: FontWeightHelper.medium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What Do Want to Notes ?",
              style: TextStyles.font24Regular.copyWith(
                color: AppColors.black,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            verticalSpacing(20),
            Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return BuildCategoryCard(
                    category: TasksCubit.get(context).categories[index],
                    onTap: () {
                      TasksCubit.get(context).selectedCategoryIndex(index);
                      log(index.toString());
                      Navigation.navigateToWithoutNavBar(
                        context,
                        const TaskDetailsScreen(),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => verticalSpacing(16),
                itemCount: TasksCubit.get(context).categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
