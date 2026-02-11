import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/Firebase/firestore_manager.dart';
import 'package:evently/core/providers/EventProvider.dart';
import 'package:evently/core/resources/AppCostance.dart';
import 'package:evently/models/Event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/providers/theme_provider.dart';
import '../../core/resources/AssetsManager.dart';
import '../../core/resources/DialogUtils.dart';
import '../../core/resources/StringsManager.dart';
import '../../core/resources/Validation.dart';
import '../../core/resources/app_icons.dart';
import '../../core/reusable/CustomAppBar.dart';
import '../../core/reusable/Custom_field.dart';
import '../../core/reusable/Custome_button.dart';
import '../Add_event/widgets/TabViewImage.dart';
import '../Add_event/widgets/TimeRow.dart';
import '../home/homeScreen.dart';
import '../home/taps/Home_tab/widgets/TabContainer.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({super.key});

  static const routeName = "edit_event_screen";

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late TextEditingController titleController;
  late TextEditingController descController;
  late EventProvider eventProvider;
  late String eventType;
  late DateTime dateAndTime;
  GlobalKey<FormState> formKey = GlobalKey();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    eventProvider = context.read<EventProvider>();
    titleController = TextEditingController(text: eventProvider.myEvent?.title);
    descController = TextEditingController(text: eventProvider.myEvent?.desc);
    eventType = eventProvider.myEvent?.type ?? "";
    dateAndTime = eventProvider.myEvent!.dateOfTime!.toDate();
    if (Appcostance.evetsTypes.contains(eventType)) {
      selectedIndex = Appcostance.evetsTypes.indexOf(eventType);
    }

    selectedDate = DateTime(
        dateAndTime.year,
        dateAndTime.month,
        dateAndTime.day
    );
    selectedTime = TimeOfDay(
        hour: dateAndTime.hour,
        minute: dateAndTime.minute
    );
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
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery
        .of(context)
        .size
        .height;
    String? formattedTime = selectedTime?.format(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          StringsManager.editEvent.tr(),
          style: Theme
              .of(
            context,
          )
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DefaultTabController(
            initialIndex: selectedIndex,
            length: Appcostance.evetsTypes.length,
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
                        TabViewImage(
                          image: themeProvider.mode != ThemeMode.dark
                              ? AssetsManager.sportImage
                              : AssetsManager.sportImageDark,
                        ),
                        TabViewImage(
                          image: themeProvider.mode != ThemeMode.dark
                              ? AssetsManager.birthdayImage
                              : AssetsManager.birthdayImageDark,
                        ),
                        TabViewImage(
                          image: themeProvider.mode != ThemeMode.dark
                              ? AssetsManager.bookImage
                              : AssetsManager.bookImageDark,
                        ),
                        TabViewImage(
                          image: themeProvider.mode != ThemeMode.dark
                              ? AssetsManager.meetingImage
                              : AssetsManager.meetingImageDark,
                        ),
                        TabViewImage(
                          image: themeProvider.mode != ThemeMode.dark
                              ? AssetsManager.exhibitionImage
                              : AssetsManager.exhibitionImageDark,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  TabBar(
                    onTap: (value) {
                      selectedIndex = value;
                    },
                    dividerHeight: 0,
                    unselectedLabelColor: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    unselectedLabelStyle: Theme
                        .of(
                      context,
                    )
                        .textTheme
                        .titleSmall,
                    labelStyle: Theme
                        .of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                      color: Theme
                          .of(
                        context,
                      )
                          .colorScheme
                          .secondaryContainer,
                    ),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,
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
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall,
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
                      text: StringsManager.upDateEvent.tr(),
                      onclick: () {
                        editEvent();
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

  Future<void> editEvent() async {
    if (formKey.currentState!.validate()) {
      if (selectedTime == null) {
        DialogUtils.showToast("Choose event Time", context);
      } else if (selectedDate == null) {
        DialogUtils.showToast("Choose event Date", context);
      } else {
        try {
          DialogUtils.loadingDialog(context: context);
          DateTime eventDate = DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            selectedTime!.hour,
            selectedTime!.minute,
          );
          Event newEvent = Event(
            id: eventProvider.myEvent?.id,
            title: titleController.text,
            desc: descController.text,
            userId: FirebaseAuth.instance.currentUser!.uid,
            type: Appcostance.evetsTypes[selectedIndex],
            dateOfTime: Timestamp.fromDate(eventDate),
          ) ;
          await FirestoreManager.updateEvent(event: newEvent);
          eventProvider.UpdateEvent(newEvent: newEvent);
          Navigator.pop(context);
          Navigator.pushNamed(context, Homescreen.routeName);
          DialogUtils.showToast("Event Updated successfully..!", context);
        } catch (e) {
          Navigator.pop(context);
          DialogUtils.showToast("Error: $e", context);
        }
      }
    }
  }
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
