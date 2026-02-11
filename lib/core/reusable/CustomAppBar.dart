import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/AssetsManager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          width: 32,
          height: 32,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              EasyLocalization.of(context)?.locale.languageCode == 'ar'
                  ? AssetsManager.arrowRight
                  : AssetsManager.arrowBack,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      title: title,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
