import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  final VoidCallback onclick;

  String iconImage;

  bool isTrash;

  CustomIcon({
    required this.onclick,
    required this.iconImage,
    this.isTrash = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:  onclick,
      icon: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ),
        width: 32,
        height: 32,
        child: Directionality(
          textDirection: Directionality.of(context),
          child: SvgPicture.asset(
            iconImage,
            colorFilter: ColorFilter.mode(
              isTrash
                  ? Theme.of(context).colorScheme.primaryFixed
                  : Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
