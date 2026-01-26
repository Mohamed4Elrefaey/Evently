import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ThemeModeLD extends StatelessWidget {
  final String theme;

  ThemeModeLD({required this.theme});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context); // Access the same object that i create in the Main file
    return Container(
      height: 32,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              provider.changeMode(ThemeMode.light);
            },
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              decoration: BoxDecoration(
                color: theme == "light"
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: SvgPicture.asset(
                  AssetsManager.sun,
                  colorFilter: ColorFilter.mode(
                    theme == "light"
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () {
              provider.changeMode(ThemeMode.dark);
            },
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              decoration: BoxDecoration(
                color: theme == "dark"
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: SvgPicture.asset(
                  AssetsManager.moon,
                  colorFilter: ColorFilter.mode(
                    theme == "dark"
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
