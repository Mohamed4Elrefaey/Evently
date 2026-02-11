import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/EventProvider.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/Event_details/widget/Date_container.dart';
import 'package:evently/ui/Event_details/widget/Event_Image.dart';
import 'package:evently/ui/Event_details/widget/Event_Title.dart';
import 'package:evently/ui/Event_details/widget/description.dart';
import 'package:evently/ui/Event_details/widget/detials_appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});
  static const routeName = "eventDetailsScreen";

  @override
  Widget build(BuildContext context) {
    EventProvider eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
      appBar: DetailsAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventImage(type: eventProvider.currentEvent?.type),
            SizedBox(height: 16),
            EventTitle(title: eventProvider.currentEvent?.title),
            SizedBox(height: 16),
            DateContainer(
              allDate: eventProvider.currentEvent!.dateOfTime!.toDate(),
            ),
            SizedBox(height: 16),
            Text(
              StringsManager.description.tr(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 8),
            Description(desc: eventProvider.currentEvent!.desc),
          ],
        ),
      ),
    );
  }

}
