import 'package:evently_app/model/event.dart';
import 'package:evently_app/providers/eventListProvider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles%20copy.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItemWidget extends StatelessWidget {
  Event event;
  EventItemWidget({required this.event});
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var eventListProvider = Provider.of<EventListProvider>(context);
    return Container(
      height: hight * 0.31,
      margin: EdgeInsets.symmetric(vertical: hight * 0.008),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.primaryLight, width: 2),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(event.image))),
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
                  event.dateTime.day.toString(),
                  style: AppStyles.bold20Primary,
                ),
                Text(DateFormat("MMM").format(event.dateTime),
                    style: AppStyles.bold20Primary),
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
                  event.title,
                  style: AppStyles.bold14Black,
                ),
                InkWell(
                  onTap: () {
                    eventListProvider.updateFavoriteEvent(event);
                  },
                  child: Image.asset(
                    event.isFavorite == true
                        ? AssetsManger.iconSelectedFavorite
                        : AssetsManger.iconartUnSelected,
                    color: AppColors.primaryLight,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
