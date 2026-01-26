import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  // declare
  static late SharedPreferences preferences;

  static Future<void> init() async {
    // initialize an object
    preferences = await SharedPreferences.getInstance();
  }

  static void SaveThemeMode(ThemeMode newMode) {
    if (newMode == ThemeMode.dark) {
      preferences.setString("theme", "dark");
    } else {
      preferences.setString("theme", "light");
    }
  }

  static ThemeMode getThemeMode() {
    if (preferences.getString("theme") == "dark") {
      return ThemeMode.dark;
    } else if (preferences.getString("theme") == null) {
      // to handle first time opening the app
      return ThemeMode.light;
    } else {
      return ThemeMode.light;
    }
  }
}
