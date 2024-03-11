import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';
import 'package:notable/view_model/utils/styles/text_style.dart';

class AppTextFormField extends StatelessWidget {
  final bool? readOnly;
  final TextEditingController? controller;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator? validate;
  final AutovalidateMode? autoValidateMode;
  final void Function(String)? onChanged;
  final TextCapitalization? textCapitalization;
  final bool? autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? hintStyle;
  final String hintText;
  final Widget? suffixIcon;
  final TextStyle? style;
  final bool? isObscureText;
  final int? maxLines;

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
    this.style,
    this.textCapitalization,
    this.autofocus,
    this.maxLines,
    this.readOnly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validate,
      autovalidateMode: autoValidateMode,
      onChanged: onChanged,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLines: maxLines,
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
      autofocus: autofocus ?? false,
      style: style ?? TextStyles.font16Regular.copyWith(color: AppColors.black),
      obscureText: isObscureText ?? false,
      obscuringCharacter: '*',
      cursorColor: AppColors.primaryColor,
    );
  }
}
