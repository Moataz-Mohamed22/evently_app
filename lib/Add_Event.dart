import 'package:evently_app/firebaseutils.dart';
import 'package:evently_app/home/tap_even_Widget.dart';
import 'package:evently_app/model/event.dart';
import 'package:evently_app/providers/eventListProvider.dart';
import 'package:evently_app/utils/App_Styles.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/assets_Manger.dart';
import 'package:evently_app/widget/choose_date_or_time.dart';
import 'package:evently_app/widget/custom_elevated_Button.dart';
import 'package:evently_app/widget/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  static String routeName = 'edit_evently';

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime? selectedDate;
  String formattedDate = "";
  TimeOfDay? selectedTime;
  String formattedTime = "";
  String selectedImage = "";
  String selectedEvent = "";
  late EventListProvider eventListProvider;
  @override
  Widget build(BuildContext context) {
    eventListProvider = Provider.of<EventListProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventsNameList = [
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
    List<String> imageSelectedNameList = [
      AssetsManger.sports,
      AssetsManger.birthday,
      AssetsManger.meeting,
      AssetsManger.gaming,
      AssetsManger.workShop,
      AssetsManger.bookClup,
      AssetsManger.Exhibition,
      AssetsManger.holiday,
      AssetsManger.eating,
    ];
    selectedImage = imageSelectedNameList[selectedIndex];
    selectedEvent = eventsNameList[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: width * 0.5,
                height: height * 0.3,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imageSelectedNameList[selectedIndex],
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                  height: height * 0.05,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: TapEvenWidget(
                            textSelectedStyle: AppStyles.medium16White,
                            textUnSelectedStyle: AppStyles.medium16Primary,
                            backgroundColor: AppColors.primaryLight,
                            borderColor: AppColors.primaryLight,
                            eventName: eventsNameList[index],
                            isSelect: selectedIndex == index,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: width * 0.01,
                        );
                      },
                      itemCount: eventsNameList.length)),
              SizedBox(
                height: height * 0.02,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.title,
                        style: AppStyles.bold20Black,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextFiled(
                        controller: titleController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Event Title";
                          }
                          return null;
                        },
                        hintText: AppLocalizations.of(context)!.event_title,
                        prefixIcon: Icon(Icons.edit),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextFiled(
                        controller: descriptionController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Event description";
                          }
                          return null;
                        },
                        maxLines: 4,
                        hintText:
                            AppLocalizations.of(context)!.event_description,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ChooseDateOrTime(
                        iconName: Icon(Icons.calendar_month_outlined),
                        eventNameOrTime:
                            AppLocalizations.of(context)!.event_date,
                        chooseDateOrTime: selectedDate == null
                            ? AppLocalizations.of(context)!.choose_date
                            : DateFormat("dd/MM/yyyy").format(selectedDate!),
                        onchooseDateOrTime: chooseDate,
                      ),
                      ChooseDateOrTime(
                        iconName: Icon(Icons.access_time),
                        eventNameOrTime:
                            AppLocalizations.of(context)!.event_time,
                        chooseDateOrTime: selectedTime == null
                            ? AppLocalizations.of(context)!.choose_time
                            : formattedTime,
                        onchooseDateOrTime: chooseTime,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: AppStyles.medium16black,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.01),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: AppColors.primaryLight, width: 2)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.02,
                                  horizontal: width * 0.03),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.primaryLight),
                              child: Image.asset(
                                AssetsManger.iconLocation,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                              child: Text(
                                "choose event Location",
                                style: AppStyles.bold16Primary,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.primaryLight,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomElevatedButton(
                          text: AppLocalizations.of(context)!.add_event,
                          onButtonClicked: addEvent)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      Event event = Event(
          title: titleController.text,
          description: descriptionController.text,
          image: selectedImage,
          dateTime: selectedDate!,
          eventName: selectedEvent,
          time: formattedTime);
      FirebaseUtils.addEventToFireStore(event).timeout(
        Duration(milliseconds: 500),
        onTimeout: () {
          print("event added succfully");
          SnackBar(content: Text("Event Added"));
          eventListProvider.getAllEvent();
          Navigator.pop(context);
        },
      );
      if (selectedDate == null || selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please choose both date and time for the event!"),
        ));
        return;
      }
      print("Event Title: ${titleController.text}");
      print("Event Description: ${descriptionController.text}");
      print("Event Date: $formattedDate");
      print("Event Time: $formattedTime");
    }
  }

  void chooseDate() async {
    var chosenDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 730)),
        initialDate: DateTime.now());
    if (chosenDate != null) {
      selectedDate = chosenDate;
      formattedDate = DateFormat("dd/MM/yyyy").format(selectedDate!);
      setState(() {});
    }
  }

  void chooseTime() async {
    var chosenTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (chosenTime != null) {
      selectedTime = chosenTime;
      formattedTime = selectedTime!.format(context);
      setState(() {});
    }
  }
}
