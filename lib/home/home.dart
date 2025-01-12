import 'package:evently_app/home/event_item_widget.dart';
import 'package:evently_app/home/tap_even_Widget.dart';
import 'package:evently_app/providers/eventListProvider.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getEventNameList(context);
    if (eventListProvider.eventList.isEmpty) {
      eventListProvider.getAllEvent();
    }

    /* List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.bookclub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];*/
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: eventListProvider.eventsNameList.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: hight * 0.1,
            backgroundColor: AppColors.primaryLight,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcomeback,
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppStyles.regular14White.fontFamily,
                      ),
                    ),
                    SizedBox(height: hight * 0.01),
                    Text(
                      "Moataz Mohamed",
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppStyles.bold24White.fontFamily,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.sunny, color: AppColors.white),
                SizedBox(width: width * 0.02),
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "EN",
                    style: TextStyle(
                      fontFamily: AppStyles.bold14Primary.fontFamily,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Container(
                // padding: EdgeInsets.symmetric(
                //  horizontal: width * 0.04, vertical: hight * 0.01),
                height: hight * 0.1,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.white),
                        SizedBox(width: width * 0.02),
                        Text(
                          "Cairo, Egypt",
                          style: TextStyle(
                            fontFamily: AppStyles.medium14White.fontFamily,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: hight * 0.02),
                    TabBar(
                      onTap: (index) {
                        eventListProvider.changeSelectedIndex(index);
                      },
                      isScrollable: true,
                      indicatorColor: AppColors.transparentColor,
                      tabs: eventListProvider.eventsNameList.map((eventName) {
                        return TapEvenWidget(
                          textSelectedStyle: AppStyles.medium16Primary,
                          textUnSelectedStyle: AppStyles.medium16White,
                          backgroundColor: AppColors.white,
                          isSelect: eventListProvider.selectedIndex ==
                              eventListProvider.eventsNameList
                                  .indexOf(eventName),
                          eventName: eventName,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: eventListProvider.eventList.isEmpty
                    ? Center(
                        child: Text(
                          "NO ITEMS found",
                          style: TextStyle(
                            fontFamily: AppStyles.medium16White.fontFamily,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: EventItemWidget(
                              event: eventListProvider.filterList[index],
                            ),
                          );
                        },
                        itemCount: eventListProvider.filterList.length,
                      ),
              ),
            ],
          ),
        ));
  }
}
