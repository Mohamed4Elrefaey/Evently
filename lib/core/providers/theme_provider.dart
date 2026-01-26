
import 'package:evently/core/remote/local/presManager.dart';
import 'package:flutter/material.dart';
// observable
// publisher
// implementation for observable design pattern
class ThemeProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  void initTheme(){
    mode = PrefsManager.getThemeMode();
  }
  void changeMode(ThemeMode newMode){
    mode = newMode;
    PrefsManager.SaveThemeMode(mode);
    notifyListeners() ;   // tell listeners and rebuild , // instead of setState
  }
}