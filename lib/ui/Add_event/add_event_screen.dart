import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/CustomAppBar.dart';
import 'package:evently/core/reusable/Custom_field.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:evently/ui/Add_event/widgets/TabViewImage.dart';
import 'package:evently/ui/Add_event/widgets/TimeRow.dart';
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
                  dividerHeight: 0,
                  unselectedLabelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                  labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondaryContainer,
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
                  Controller: titleController,
                  validation: (value) {

                  },
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
                  Controller: descController,
                  validation: (value) {},
                ),
                SizedBox(height: 16),
                TimeRow(
                  icon: AssetsManager.calender,
                  title: StringsManager.eventDate.tr(),
                  choose: StringsManager.chooseDate.tr(),
                ),
                TimeRow(
                  icon: AssetsManager.calender,
                  title: StringsManager.eventDate.tr(),
                  choose: StringsManager.chooseDate.tr(),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: CustomeButton(
                    text: StringsManager.addEvent.tr(),
                    onclick: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
