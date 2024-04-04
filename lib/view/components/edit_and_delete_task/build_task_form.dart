import 'package:flutter/material.dart';
import 'package:notable/view/components/widgets/app_text_form_field.dart';
import 'package:notable/view_model/bloc/task/tasks_cubit.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/functions/functions.dart';
import 'package:notable/view_model/utils/styles/font_weight_helper.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class BuildTaskForm extends StatelessWidget {
  const BuildTaskForm({
    super.key,
    required this.cubit,
  });

  final TasksCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            validate: (c) {
              if (c == null || c.isEmpty) {
                return "Title is required";
              }
              return null;
            },
            hintText: "Add Title",
            keyboardType: TextInputType.multiline,
            controller: cubit.initialTitleController,
            textInputAction: TextInputAction.next,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            textCapitalization: TextCapitalization.sentences,
            autofocus: true,
            maxLines: null,
          ),
          AppTextFormField(
            validate: (c) {
              if (c == null || c.isEmpty) {
                return "Description is required";
              }
              return null;
            },
            hintText: "Type something...",
            keyboardType: TextInputType.multiline,
            controller: cubit.initialDescriptionController,
            textInputAction: TextInputAction.done,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            style: TextStyles.font16Regular.copyWith(
              color: AppColors.black,
              fontWeight: FontWeightHelper.light,
            ),
            textCapitalization: TextCapitalization.sentences,
            maxLines: null,
          ),
          AppTextFormField(
            controller: cubit.initialFirstDateController,
            keyboardType: TextInputType.none,
            validate: (c) {
              if (c == null || c.isEmpty) {
                return "FirstDate is required";
              }
              return null;
            },
            readOnly: true,
            onTap: () {
              datePicker(
                context: context,
                textEditingController: cubit.initialFirstDateController,
              );
            },
            hintText: "FirstDate",
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
          verticalSpacing(10),
          AppTextFormField(
            controller: cubit.initialLastDateController,
            keyboardType: TextInputType.none,
            validate: (c) {
              if (c == null || c.isEmpty) {
                return "LastDate is required";
              }
              return null;
            },
            readOnly: true,
            onTap: () {
              datePicker(
                context: context,
                textEditingController: cubit.initialLastDateController,
              );
            },
            hintText: "LastDate",
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ],
      ),
    );
  }
}
