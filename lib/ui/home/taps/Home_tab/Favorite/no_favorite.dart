import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoFavorite extends StatelessWidget {
  const NoFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            duration: Duration(milliseconds: 3000),
            child: Image.asset(
              themeProvider.mode != ThemeMode.light
                  ? AssetsManager.noFavoriteDark
                  : AssetsManager.noFavoriteLight,
            ),
          ),
          SizedBox(height: 16),
          FadeIn(
            duration: Duration(milliseconds: 5000),
            child: Text(
              StringsManager.noFavorite.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
