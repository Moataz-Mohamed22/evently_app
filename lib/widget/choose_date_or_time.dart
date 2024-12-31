import 'package:evently_app/utils/app_styles%20copy.dart';
import 'package:flutter/material.dart';

class ChooseDateOrTime extends StatelessWidget {
  Icon? iconName;
  String eventNameOrTime;
  String chooseDateOrTime;
  Function onchooseDateOrTime;
  ChooseDateOrTime(
      {required this.iconName,
      required this.onchooseDateOrTime,
      required this.eventNameOrTime,
      required this.chooseDateOrTime});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconName?.icon),
        Text(
          eventNameOrTime,
          style: AppStyles.medium16black,
        ),
        Spacer(),
        TextButton(
            onPressed: () {
              onchooseDateOrTime();
            },
            child: Text(
              chooseDateOrTime,
              style: AppStyles.medium16Primary,
            ))
      ],
    );
  }
}
