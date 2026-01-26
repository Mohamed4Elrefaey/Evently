import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/settingsContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mode extends StatelessWidget {
  const Mode({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return SettingsContainer(
      title: StringsManager.dark.tr(),
      action: CupertinoSwitch(
        value: provider.mode == ThemeMode.dark ? true : false,
        activeTrackColor: Theme.of(context).colorScheme.primary,
        onChanged: (value) {
          if (provider.mode == ThemeMode.dark) {
            provider.changeMode(ThemeMode.light);
          } else {
            provider.changeMode(ThemeMode.dark);
          }
        },
      ),
    );
  }
}
