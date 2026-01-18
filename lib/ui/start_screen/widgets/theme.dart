import 'package:evently/core/resources/AssetsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemeModeLD extends StatelessWidget {
  final String theme;

  ThemeModeLD({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      child: Row(
        children: [
          Container(
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
          SizedBox(width: 8),
          Container(
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
        ],
      ),
    );
    ;
  }
}
