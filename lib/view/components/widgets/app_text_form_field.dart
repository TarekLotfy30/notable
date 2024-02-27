import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator? validate;
  final AutovalidateMode? autoValidateMode;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? hintStyle;
  final String hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;

  const AppTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    required this.validate,
    this.autoValidateMode,
    this.onChanged,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.hintStyle,
    required this.hintText,
    this.suffixIcon,
    this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validate,
      autovalidateMode: autoValidateMode,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.baseGrayColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.errorColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.errorColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
        hintStyle: hintStyle ??
            TextStyles.font16Regular.copyWith(color: AppColors.baseGrayColor),
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.whiteColor,
      ),
      style: TextStyles.font16Regular.copyWith(color: AppColors.black),
      obscureText: isObscureText ?? false,
      obscuringCharacter: '*',
      cursorColor: AppColors.primaryColor,
      cursorHeight: 27,
    );
  }
}
