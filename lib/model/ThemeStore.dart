import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStore{
  static late SharedPreferences sharedPreferences;//持久化存储实例
  static const _mode = "theme_mode";//用于持久化的key
  static const modeSystem = 0 ;//自动
  static const modeLight = 1;//亮色
  static const modeDark = 2 ;//暗黑

  //初始化
   static init() async{
     sharedPreferences = await SharedPreferences.getInstance();
   }
  // 常量转枚举
   static ThemeMode constConvertToEnum(int mode){
     switch(mode){
       case modeLight:
         return ThemeMode.light;
       case modeDark:
         return ThemeMode.dark;
       default:
         return ThemeMode.system;
     }
   }
   //枚举转常量
  static int enumConvertToConst(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return modeLight;
      case ThemeMode.dark:
        return modeDark;
      default:
        return modeSystem;
    }
  }
  //设置主题颜色
  static Future setthemeModel(ThemeMode themeMode) async{
    return await sharedPreferences.setInt(_mode, enumConvertToConst(themeMode));
  }

  //获取主题模式
  static ThemeMode getThemeModel(){
     int? result  = sharedPreferences.getInt(_mode);
     return constConvertToEnum(result??modeSystem);
  }




}