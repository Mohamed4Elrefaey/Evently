import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resources/StringsManager.dart';

class TimeRow extends StatelessWidget {
  String icon;
  String title;
  String choose;
  final VoidCallback onClick ;

  TimeRow({required this.icon, required this.title, required this.choose , required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 8),
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        Spacer(),
        TextButton(
          onPressed: onClick,
          child: Text(
            choose,
            style: Theme.of(context).textTheme.displayLarge
          ),
        ),
      ],
    );
  }
}
