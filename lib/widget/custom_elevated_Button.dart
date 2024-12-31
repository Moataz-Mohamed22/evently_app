import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomElevatedButton extends StatelessWidget {
  Color? backgroundColor;
  Widget? prefixIconButton;
  String text;
  TextStyle? textStyle;
  Function onButtonClicked;
  CustomElevatedButton(
      {this.backgroundColor,
      this.prefixIconButton,
      required this.text,
      this.textStyle,
      required this.onButtonClicked});
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primaryLight,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.02),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: AppColors.primaryLight, width: 2))),
        onPressed: () {
          onButtonClicked();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIconButton ?? SizedBox(),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              text,
              style: textStyle ?? AppStyles.medium20White,
            )
          ],
        ));
  }
}
