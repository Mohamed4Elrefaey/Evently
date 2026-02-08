import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/Firebase/firestore_manager.dart';
import 'package:evently/core/resources/AppCostance.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/DialogUtils.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/resources/Validation.dart';
import 'package:evently/core/reusable/CustomAppBar.dart';
import 'package:evently/core/reusable/Custom_field.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:evently/models/Event_model.dart';
import 'package:evently/ui/Add_event/widgets/TabViewImage.dart';
import 'package:evently/ui/Add_event/widgets/TimeRow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/resources/app_icons.dart';
import '../home/taps/Home_tab/widgets/TabContainer.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  static const String routeName = "addEvent";

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late TextEditingController titleController;
  late TextEditingController descController;
  GlobalKey<FormState> formKey = GlobalKey();
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    titleController = TextEditingController();
    descController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    String? formattedTime;
    if (selectedTime != null) {
      formattedTime = MaterialLocalizations.of(context)
          .formatTimeOfDay(selectedTime!, alwaysUse24HourFormat: false);
    }


    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          StringsManager.addEvent.tr(),
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DefaultTabController(
            length: 5,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: height * 0.23,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TabViewImage(image: AssetsManager.sportImage),
                        TabViewImage(image: AssetsManager.birthdayImage),
                        TabViewImage(image: AssetsManager.bookImage),
                        TabViewImage(image: AssetsManager.meetingImage),
                        TabViewImage(image: AssetsManager.exhibitionImage),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  TabBar(
                    onTap: (value) {
                      selectedIndex = value;
                    },
                    dividerHeight: 0,
                    unselectedLabelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelStyle: Theme.of(
                      context,
                    ).textTheme.titleSmall,
                    labelStyle: Theme.of(context).textTheme.titleSmall
                        ?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                        ),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    tabs: [
                      Tab(
                        child: TabContainer(
                          icon: MyFlutterApp.sport,
                          title: StringsManager.sport.tr(),
                        ),
                      ),
                      Tab(
                        child: TabContainer(
                          icon: MyFlutterApp.birthday_cake,
                          title: StringsManager.birthday.tr(),
                        ),
                      ),
                      Tab(
                        child: TabContainer(
                          icon: MyFlutterApp.book,
                          title: StringsManager.book.tr(),
                        ),
                      ),
                      Tab(
                        child: TabContainer(
                          icon: MyFlutterApp.meeting,
                          title: StringsManager.meeting.tr(),
                        ),
                      ),
                      Tab(
                        child: TabContainer(
                          icon: MyFlutterApp.exhibition,
                          title: StringsManager.exhibition.tr(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    StringsManager.title.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 8),
                  CustomField(
                    hint: StringsManager.eventTitle.tr(),
                    controller: titleController,
                    validation: Validation.validateTitle,
                  ),
                  SizedBox(height: 16),
                  Text(
                    StringsManager.description.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 8),
                  CustomField(
                    maxLines: 7,
                    hint: StringsManager.descTitle.tr(),
                    controller: descController,
                    validation: Validation.validateDesc,
                  ),
                  SizedBox(height: 16),
                  TimeRow(
                    icon: AssetsManager.calender,
                    title: StringsManager.eventDate.tr(),
                    choose: selectedDate != null
                        ? DateFormat.yMEd().format(selectedDate!)
                        : StringsManager.chooseDate.tr(),
                    onClick: chooseDate,
                  ),
                  TimeRow(
                    icon: AssetsManager.clock,
                    title: StringsManager.eventTime.tr(),
                    choose: formattedTime ?? StringsManager.chooseTime.tr(),
                    onClick: chooseTime,
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: CustomeButton(
                      text: StringsManager.addEvent.tr(),
                      onclick: () {
                        addEvent();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addEvent() async {
    if (formKey.currentState!.validate()) {
      if(selectedTime == null ){
        DialogUtils.showToast("Choose event Time", context);
      }else if(selectedDate == null){
        DialogUtils.showToast("Choose event Date", context);
      }else{
        try{
          DialogUtils.loadingDialog(context: context);
          DateTime eventDate = DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            selectedTime!.hour,
            selectedTime!.minute,
          );
          Event event = Event(
            title: titleController.text,
            desc: descController.text,
            userId: FirebaseAuth.instance.currentUser!.uid,
            type: Appcostance.evetsTypes[selectedIndex],
            dateOfTime: Timestamp.fromDate(eventDate),
          );
          await FirestoreManager.addEvent(event: event);
          Navigator.pop(context);
          DialogUtils.showToast("Event added successfully..!", context);
        } catch (e){
          Navigator.pop(context);
          DialogUtils.showToast("Error: $e", context);
        }
      }
    }
  }

  DateTime? selectedDate;

  Future<void> chooseDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: selectedDate,
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
    }
  }

  TimeOfDay? selectedTime;

  Future<void> chooseTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime == null ? TimeOfDay.now() : selectedTime!,
    );
    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
    }
  }
}
