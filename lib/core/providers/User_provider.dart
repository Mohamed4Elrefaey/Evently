
import 'package:evently/core/Firebase/firestore_manager.dart';
import 'package:evently/models/User.dart';
import 'package:flutter/material.dart';

class UserProvider  extends ChangeNotifier{
  User? UserData ;

  void getUserFromFirestore() async{
    User? user = await FirestoreManager.getUser();
    UserData = user ;
    notifyListeners();
  }
}