import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateContainer extends StatelessWidget {
  DateTime allDate ;
  DateContainer({required this.allDate});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String date = DateFormat('dd MMM' , context.locale.languageCode).format(allDate);
    String time = DateFormat('hh:mm a' , context.locale.languageCode).format(allDate);
    return Container(
      width: double.infinity,
      height: height * 0.086,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  AssetsManager.calender,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: Theme.of(context).textTheme.labelMedium,),
                Text(time ,style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onTertiaryContainer
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
