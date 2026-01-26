import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:flutter/material.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text(StringsManager.arabic),
          onTap: () {
            context.setLocale(Locale('ar'));
          },
        ),
        PopupMenuItem(
          child: Text(StringsManager.english),
          onTap: () {
            context.setLocale(Locale('en'));
          },
        ),
      ],
    );
  }
}
