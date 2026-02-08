
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:flutter/material.dart';


class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});


  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 16,
          children: [
            Text(StringsManager.logoutDialog.tr()),
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
