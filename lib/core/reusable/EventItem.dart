import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      height: height * 0.23,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme
              .of(context)
              .colorScheme
              .onSecondaryContainer,
        ),
      ),
      child: Stack(
        children: [
          Image.asset(
            provider.mode == ThemeMode.dark
                ? AssetsManager.birthdayImageDark
                : AssetsManager.birthdayImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme
                        .of(context)
                        .colorScheme
                        .surfaceBright,
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSecondaryContainer,
                    ),
                  ),
                  child: Text(
                    "12 Jan",
                    style: Theme
                        .of(
                      context,
                    )
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme
                        .of(context)
                        .colorScheme
                        .surfaceBright,
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSecondaryContainer,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            StringsManager.birthdayParty.tr(),
                            style: Theme
                                .of(
                              context,
                            )
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 14),
                          ),
                        ),
                      ),
                      SvgPicture.asset(AssetsManager.heart),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
