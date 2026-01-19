

import 'package:flutter/cupertino.dart';

abstract final class Appcostance {
  static const String  emailRegex  = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
  static const String passRegex = r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";
  static const String nameRegex = r"^[A-Za-z\u0600-\u06FF ]{2,50}$";

}




extension CharactersLenght on String{
  int charLenght(){
    return this.length;
  }
}