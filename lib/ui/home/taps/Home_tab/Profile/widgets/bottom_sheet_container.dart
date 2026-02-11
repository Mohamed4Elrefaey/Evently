import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      onChanged: (value) {
        if (value != null) {
          context.setLocale(Locale(value));
          Navigator.pop(context);
        }
      },
      groupValue: context.locale.languageCode,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 180,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(AssetsManager.xIcon),
                  ),
                  SizedBox(width: 8),
                  Text(
                    StringsManager.language.tr(),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              RadioListTile(
                title: Text(
                  StringsManager.arabic.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                value: "ar",
                dense: true,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                fillColor: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Theme.of(context).colorScheme.primary;
                  }
                  return Theme.of(context).colorScheme.onTertiaryContainer;
                }),
              ),
              RadioListTile(
                title: Text(
                  StringsManager.english.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                value: "en",
                dense: true,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                fillColor: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Theme.of(context).colorScheme.primary;
                  }
                  return Theme.of(context).colorScheme.onTertiaryContainer;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
