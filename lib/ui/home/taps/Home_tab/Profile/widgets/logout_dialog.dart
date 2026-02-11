
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/ui/home/taps/Home_tab/Profile/widgets/Dialog_Btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../login_screen/LoginScreen.dart';


class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: Container(
        height: height * 0.30,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset( provider.mode != ThemeMode.light ?
                  AssetsManager.logoutDialog : AssetsManager.logoutDialogLight ,
              ),
              SizedBox(height: 16,),
              Text(
                StringsManager.logoutDialogTitle.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DialogBtn(onClick: () {
                    Navigator.pop(context);
                  },),
                  SizedBox(width: 16,),
                  DialogBtn(onClick: () async{
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  }, isYes: true,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
