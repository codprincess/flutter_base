import 'package:flutter/material.dart';

class DarkModeProvider with ChangeNotifier{
  //模式跟随系统
  ThemeMode themeMode = ThemeMode.light;
  setThemeMode(ThemeMode mode){
    print(mode);
    themeMode = mode;
    notifyListeners();
  }
}