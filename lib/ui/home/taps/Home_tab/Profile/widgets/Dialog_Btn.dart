import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/ColorsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:flutter/material.dart';

class DialogBtn extends StatelessWidget {
  final VoidCallback onClick;

  bool isYes;

  DialogBtn({super.key, required this.onClick, this.isYes = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          backgroundColor: isYes
              ? Theme.of(context).colorScheme.primaryFixed
              : Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Theme.of(context).colorScheme.primaryFixed),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            isYes
                ? StringsManager.logoutBtnYes.tr()
                : StringsManager.logoutBtnNo.tr(),
            style: isYes
                ? Theme.of(context).textTheme.displaySmall
                : Theme.of(
                    context,
                  ).textTheme.displaySmall!.copyWith(color: ColorsManager.red),
          ),
        ),
      ),
    );
  }
}
