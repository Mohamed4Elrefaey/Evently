import 'package:evently/core/reusable/EventItem.dart';
import 'package:flutter/material.dart';

class MeetingTab extends StatelessWidget {
  const MeetingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => EventItem(),
      separatorBuilder: (context, index) => SizedBox(height: 16,),
      itemCount: 10,
    );
  }
}
