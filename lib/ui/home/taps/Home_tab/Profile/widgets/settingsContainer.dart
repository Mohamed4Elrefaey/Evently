import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:flutter/material.dart';

class SettingsContainer extends StatelessWidget {

  String title ;
  Widget action ;

  SettingsContainer({required this.title , required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16
        ),
        child: Row(
          children: [
            Text(
              title.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(),
            action,
          ],
        ),
      ),
    );
  }
}
