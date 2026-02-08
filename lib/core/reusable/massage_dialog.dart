import 'package:flutter/material.dart';

class MassageDialog extends StatelessWidget {
  String massage;

  MassageDialog({required this.massage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Error",
        style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 18),
      ),
      content: Text(massage, style: Theme.of(context).textTheme.bodyMedium),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Ok",
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
