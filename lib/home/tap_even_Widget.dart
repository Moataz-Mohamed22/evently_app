import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TapEvenWidget extends StatelessWidget {
  bool isSelect;
  String eventName;
  Color backgroundColor;
  TextStyle textSelectedStyle;
  TextStyle textUnSelectedStyle;
  Color? borderColor;
  TapEvenWidget(
      {required this.isSelect,
      required this.eventName,
      required this.backgroundColor,
      required this.textSelectedStyle,
      required this.textUnSelectedStyle,
      this.borderColor});
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: hight * 0.002),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46),
          color: isSelect ? backgroundColor : AppColors.transparentColor,
          border:
              Border.all(color: borderColor ?? AppColors.white, width: 1)),
      child: Text(
        eventName,
        style: isSelect ? textSelectedStyle : textUnSelectedStyle,
      ),
    );
  }
}
