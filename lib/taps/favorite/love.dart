import 'package:evently_app/home/event_item_widget.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles%20copy.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:evently_app/widget/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Love extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: ListView.builder(
              itemBuilder: (context, index) {
                return EventItemWidget();
              },
              itemCount: 20,
            ))
          ],
        ),
      ),
    );
  }
}
