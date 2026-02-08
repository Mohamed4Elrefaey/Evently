import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/User_provider.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/Language.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/Logout.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/Mode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});


  @override
  Widget build(BuildContext context) {
    // object of user provider
    UserProvider userProvider = Provider.of<UserProvider>(context);
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
              userProvider.UserData?.name?? " ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 4),
            Text(
              userProvider.UserData?.email??" ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 32),
            Mode(),
            SizedBox(height: 16),
            Language(click: (){},),
            SizedBox(height: 16),
            Logout(),
          ],
        ),
      ),
    );
  }
}
