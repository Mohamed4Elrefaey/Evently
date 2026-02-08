import 'package:evently/core/reusable/loading_Dialog.dart';
import 'package:evently/core/reusable/massage_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtils {
  static void loadingDialog({required BuildContext context}) {
    showDialog(context: context, barrierDismissible: false, builder: (context) => LoadingDialog());
  }

  static void massageDialog({
    required BuildContext context,
    required String massage,
  }) {
    showDialog(
      barrierDismissible: false, // to do not allow user to close dialog from screen if click on it
      context: context,
      builder: (context) => MassageDialog(massage: massage),
    );
  }



  static void showToast(String message , BuildContext context){
    Fluttertoast.showToast(
        msg: message ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM, // place of toast
        timeInSecForIosWeb: 2,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        textColor: Theme.of(context).colorScheme.onTertiary,
        fontSize: 16.0
    );
  }

}
