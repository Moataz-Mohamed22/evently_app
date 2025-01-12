import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles%20copy.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  Color? bordercolor;
  String hintText;
  String? labelText;
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  TextStyle? style;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  int? maxLines;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  TextEditingController? controller;

  CustomTextFiled(
      {this.bordercolor,
      this.keyboardType=TextInputType.text,
      this.controller,
      this.validator,
      required this.hintText,
      this.labelText,
      this.hintStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.labelStyle,
      this.style,
      this.obscureText,
      this.maxLines});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      style: style ?? AppStyles.bold14Black,
      cursorColor: AppColors.blackColor,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: hintStyle ?? AppStyles.medium16Grey,
          labelText: labelText,
          labelStyle: labelStyle,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: bordercolor ?? AppColors.grey, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: bordercolor ?? AppColors.grey, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.redColor, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.redColor, width: 2))),
    );
  }
}
