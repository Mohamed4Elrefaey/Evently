import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/User_provider.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/settingsContainer.dart';
import 'package:evently/ui/login_screen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
      child: SettingsContainer(
        title: StringsManager.logout.tr(),
        action: SvgPicture.asset(AssetsManager.logout),
      ),
    );
  }
}
