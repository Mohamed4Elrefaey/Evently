import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/resources/AppCostance.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventImage extends StatelessWidget {
  String? type;

  EventImage({required this.type});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    ThemeProvider mode = Provider.of<ThemeProvider>(context);
    String? image = mode.mode != ThemeMode.dark
        ? Appcostance.typesOfEventsLight[type]
        : Appcostance.typesOfEventsDark[type] ;

    return Container(
      width: double.infinity,
      height: height * 0.23,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image?? AssetsManager.meeting),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
