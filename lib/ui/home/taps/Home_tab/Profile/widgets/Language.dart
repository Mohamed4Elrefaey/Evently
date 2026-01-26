import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/settingsContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'LanguageMenu.dart';

class Language extends StatelessWidget {
  void Function() click;

  Language({super.key, required this.click});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => LanguageMenu(),
      child: SettingsContainer(
        title: StringsManager.language.tr(),
        action: SvgPicture.asset(
          EasyLocalization.of(context)!.locale.languageCode == 'ar'
              ? AssetsManager.arrowBack
              : AssetsManager.arrowRight,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
