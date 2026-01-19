import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/resources/AssetsManager.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  static const String routeName = "ForgetPass";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondaryContainer,
                        ),
                      ),
                      width: 32,
                      height: 32,
                      child: SvgPicture.asset(
                        AssetsManager.arrowBack,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onSurface,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    AssetsManager.logo,
                    height: 27,
                    fit: BoxFit.fitHeight,
                  ),
                  Spacer(),
                  SizedBox(width: 32),
                ],
              ),
              SizedBox(height: 32),
              Image.asset(AssetsManager.forgetPass),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 48,
                child: CustomeButton(
                  text: StringsManager.resetPasswordBtn,
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
