
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 10,),
              Text("loading..." ,style: Theme.of(context).textTheme.displayLarge,)
            ],
          ),
        ],
      ) ,
    );
  }
}
