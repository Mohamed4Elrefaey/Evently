import 'package:evently/core/reusable/EventItem.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/Firebase/firestore_manager.dart';
import '../../../../../../models/Event_model.dart';

class ExhibitionTab extends StatelessWidget {
  const ExhibitionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreManager.getTypeEventsStream("Exhibition"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // loading
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          // error
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(onPressed: () {}, child: Text("Try again")),
            ],
          );
        }
        // success
        List<Event> all_Events = snapshot.data ?? [];
        return ListView.separated(
          itemBuilder: (context, index) => EventItem(event: all_Events[index]),
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemCount: all_Events.length,
        );
      },
    );
  }
}
