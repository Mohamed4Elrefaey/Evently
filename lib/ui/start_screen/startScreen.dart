import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:evently/ui/start_screen/widgets/language.dart';
import 'package:evently/ui/start_screen/widgets/theme.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static const String routeName = "StratScreen";

  @override
  Widget build(BuildContext context) {
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
              StringsManager.startTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
            Text(
              StringsManager.startContent,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.language,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Language(language: "ar"),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.theme,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ThemeModeLD(theme: "dark"),
              ],
            ),
            Spacer(),
            Container(
              height: 48,
              width: double.infinity,
              child: CustomeButton(
                text: StringsManager.startBtn,
                onclick: () {},
              ),
            ),
            SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
}
