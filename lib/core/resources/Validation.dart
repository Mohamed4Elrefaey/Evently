
import 'package:evently/core/resources/AppCostance.dart';

abstract class Validation {
  static String? validateEmail ( String? value){
    if(value == null || value.isEmpty){
      return "This field is required";
    }
    if(!RegExp(Appcostance.emailRegex).hasMatch(value)){
      return "Invalid email";
    }
    return null;
}

 static String? validatePass(String?value){
    if(value==null || value.isEmpty){
      return "This field is required";
    }
    if(RegExp(Appcostance.passRegex).hasMatch(value)){
      return "Invalid pass";

    }
    return null;
 }
 static String? validateConfirmPass(String?value , String pass){
    if(value==null || value.isEmpty){
      return "This field is required";
    }
    if(value != pass){
      return "Password do not match";
    }
    return null;
 }

 static String? validateName(String?value){
    if(value== null || value.isEmpty){
      return "Name is required";
    }
    if(!RegExp(Appcostance.nameRegex).hasMatch(value)){
      return "Invalid Name";
    }
    return null;
 }

}