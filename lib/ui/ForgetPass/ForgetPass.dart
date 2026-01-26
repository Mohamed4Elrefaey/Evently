import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/CustomAppBar.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:flutter/material.dart';

import '../../core/resources/AssetsManager.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  static const String routeName = "ForgetPass";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          StringsManager.forgetPasswordTitle.tr(),
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Image.asset(AssetsManager.forgetPass),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 48,
                child: CustomeButton(
                  text: StringsManager.resetPasswordBtn.tr(),
                  onclick: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
