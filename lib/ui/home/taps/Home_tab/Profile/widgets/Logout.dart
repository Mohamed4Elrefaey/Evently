import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/settingsContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logout extends StatelessWidget {
  void Function() click;

  Logout({required this.click});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: SettingsContainer(
        title: StringsManager.logout.tr(),
        action: SvgPicture.asset(AssetsManager.logout),
      ),
    );
  }
}
