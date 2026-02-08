

import 'package:evently/core/resources/AssetsManager.dart';

abstract final class Appcostance {
  static const String emailRegex = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
  static const String passRegex = r'^.{6,}$';
  static const String nameRegex = r"^[A-Za-z\u0600-\u06FF ]{2,50}$";
  static const List<String> evetsTypes = [
    "Sport",
    "Birthday",
    "Book",
    "Meeting",
    "Exhibition",
  ];


  static const Map<String,String> typesOfEventsLight = {
   "Sport" : AssetsManager.sportImage,
    "Birthday" : AssetsManager.birthdayImage,
    "Book" : AssetsManager.bookImage,
    "Meeting" : AssetsManager.meetingImage,
    "Exhibition" : AssetsManager.exhibitionImage
} ;
  static const Map<String,String> typesOfEventsDark = {
   "Sport" : AssetsManager.sportImageDark,
    "Birthday" : AssetsManager.birthdayImageDark,
    "Book" : AssetsManager.bookImageDark,
    "Meeting" : AssetsManager.meetingImageDark,
    "Exhibition" : AssetsManager.exhibitionImageDark
} ;


}

extension CharactersLenght on String {
  int charLenght() {
    return this.length;
  }
}
