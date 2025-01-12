import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/event.dart';
import 'package:evently_app/widget/ToastMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../firebaseutils.dart' show FirebaseUtils;

class EventListProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List<String> eventsNameList = [];
  void getEventNameList(BuildContext context) {
    eventsNameList = [
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
    ];
  }

  List<Event> eventList = [];
  List<Event> filterList = [];
  List<Event> favoriteEventList = [];
  void getAllEvent() async {
    print("Fetching all events...");
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().get();
    eventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    filterList = eventList;
    filterList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });
    notifyListeners();
  }

  void getFilterEvent() {
    filterList = eventList.where((event) {
      String eventCategory = eventsNameList[selectedIndex].trim().toLowerCase();
      String eventName = event.eventName.trim().toLowerCase();

      return eventCategory == eventName;
    }).toList();
    filterList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });
    notifyListeners();
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    if (selectedIndex == 0) {
      getAllEvent();
    } else {
      getFilterEvent();
    }
  }

  void getFavoriteEvent() async {
    var querySnapshot = await FirebaseUtils.getEventCollection()
        .orderBy("dateTime")
        .where("isFavorite", isEqualTo: true)
        .get();
    favoriteEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  void updateFavoriteEvent(Event event) {
    FirebaseUtils.getEventCollection()
        .doc(event.id)
        .update({"isFavorite": !event.isFavorite}).timeout(
            Duration(milliseconds: 500), onTimeout: () {
      ToastMessage.toastMsg(msg: "Event Update successfully");
      print("Event Update successfully");
      selectedIndex == 0 ? getAllEvent() : getFilterEvent();
      getFavoriteEvent();
    });
    notifyListeners();
  }
}
