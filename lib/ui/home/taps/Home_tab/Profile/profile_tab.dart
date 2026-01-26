import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/Language.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/Logout.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/Mode.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 48),
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage(AssetsManager.route),
              ),
            ),
            SizedBox(height: 16),
            Text(
              StringsManager.profileName.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 4),
            Text(
              StringsManager.mail.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 32),
            Mode(),
            SizedBox(height: 16),
            Language(click: (){},),
            SizedBox(height: 16),
            Logout(click: (){},),
          ],
        ),
      ),
    );
  }
}
