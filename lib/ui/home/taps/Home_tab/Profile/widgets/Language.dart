import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/DialogUtils.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/settingsContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Language extends StatelessWidget {

  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DialogUtils.showBottomLanguageSheet(context: context);
      },
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
