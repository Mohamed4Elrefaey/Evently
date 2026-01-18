import 'package:flutter/material.dart';

import '../../../core/resources/StringsManager.dart';

class Language extends StatelessWidget {
  final String language;

  Language({required this.language});

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
              color: language == "en"
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(
                StringsManager.english,
                style: language == "en"
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            decoration: BoxDecoration(
              color: language == "ar"
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(
                StringsManager.arabic,
                style: language == "ar"
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
