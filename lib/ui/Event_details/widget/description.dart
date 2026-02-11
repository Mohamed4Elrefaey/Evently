import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  String? desc;
  Description({required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 150,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          desc!, style: Theme.of(context).textTheme.labelSmall ,
        ),
      ),
    );
  }
}
