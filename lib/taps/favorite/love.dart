import 'package:evently_app/home/event_item_widget.dart';
import 'package:evently_app/providers/eventListProvider.dart';
import 'package:evently_app/utils/app_styles%20copy.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:evently_app/widget/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Love extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var eventListProvider = Provider.of<EventListProvider>(context);
    if (eventListProvider.favoriteEventList.isEmpty) {
      eventListProvider.getFavoriteEvent();
    }
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFiled(
              hintText: AppLocalizations.of(context)!.search_event,
              hintStyle: AppStyles.bold14Primary,
              style: AppStyles.medium16Primary,
              prefixIcon: Image.asset(AssetsManger.iconSearch),
            ),
            Expanded(
                child: eventListProvider.favoriteEventList.isEmpty
                    ? Center(
                        child: Text(
                        "No Favorite Event ",
                        style: AppStyles.bold20Black,
                      ))
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return EventItemWidget(
                            event: eventListProvider.favoriteEventList[index],
                          );
                        },
                        itemCount: eventListProvider.favoriteEventList.length,
                      ))
          ],
        ),
      ),
    );
  }
}
