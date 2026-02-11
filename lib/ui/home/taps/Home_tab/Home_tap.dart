import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/User_provider.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/resources/app_icons.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/allTabs/AllTab.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/Home_row.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/TabContainer.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/allTabs/SportTab.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/allTabs/birthdayTab.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/allTabs/bookTab.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/allTabs/exhibitionTab.dart';
import 'package:evently/ui/home/taps/Home_tab/widgets/allTabs/meetingTab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 6,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeRow(),
              SizedBox(height: 24),
              TabBar(
                dividerHeight: 0,
                unselectedLabelColor:Theme.of(context).colorScheme.primary ,
                unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.primary
                ),
                tabs: [
                  Tab(
                    child: TabContainer(
                      icon: MyFlutterApp.all,
                      title: StringsManager.all.tr(),
                    ),
                  ),
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
                      icon: MyFlutterApp.birthday_cake,
                      title: StringsManager.exhibition.tr(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TabBarView(
                      children:[
                        AllTab(),
                        SportTab(),
                        BirthdayTab(),
                        BookTab(),
                        MeetingTab(),
                        ExhibitionTab()
                      ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
