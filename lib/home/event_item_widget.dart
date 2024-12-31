import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles%20copy.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:flutter/material.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: hight * 0.31,
      margin: EdgeInsets.symmetric(
           vertical: hight * 0.008),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.primaryLight, width: 2),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(AssetsManger.birthday))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: hight * 0.01),
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.WhiteColor),
            child: Column(
              children: [
                Text(
                  "26",
                  style: AppStyles.bold20Primary,
                ),
                Text("Nov", style: AppStyles.bold20Primary),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: hight * 0.01),
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: hight * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.WhiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "This is the Birthday party",
                  style: AppStyles.bold14Black,
                ),
                Image.asset(
                  AssetsManger.iconartUnSelected,
                  color: AppColors.primaryLight,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
