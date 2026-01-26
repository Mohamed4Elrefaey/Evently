import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabContainer extends StatelessWidget {
  IconData icon;
  String title;

  TabContainer({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon ),
          SizedBox(width: 4),
          Text(title.tr()),
        ],
      ),
    );
  }
}
