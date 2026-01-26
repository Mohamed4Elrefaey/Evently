import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:evently/ui/onboarding/OnboardingScreen.dart';
import 'package:evently/ui/start_screen/widgets/language.dart';
import 'package:evently/ui/start_screen/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static const String routeName = "StratScreen";

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsManager.logo,
          height: 27,
          fit: BoxFit.fitHeight,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetsManager.startImage,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 24),
            Text(
              StringsManager.startTitle.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
            Text(
              StringsManager.startContent.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.language.tr(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Language(language: context.locale.languageCode),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.theme.tr(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ThemeModeLD(
                  theme: provider.mode == ThemeMode.dark ? "dark" : "light",
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 48,
              width: double.infinity,
              child: CustomeButton(
                text: StringsManager.startBtn.tr(),
                onclick: () {
                  Navigator.pushReplacementNamed(
                    context,
                    OnboardingScreen.routeName,
                  );
                },
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
