
import 'package:flutter/material.dart';

class EventTitle extends StatelessWidget {
  String? title ;
   EventTitle({super.key , required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title! ,
      style: Theme.of(
        context,
      ).textTheme.headlineLarge?.copyWith(fontSize: 18),
    );
  }
}
