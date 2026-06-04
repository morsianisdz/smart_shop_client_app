import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = ThemeConf.dark;

  void toggleTheme() {
    themeData =
        (themeData == ThemeConf.light) ? ThemeConf.dark : ThemeConf.light;
    Get.changeTheme(themeData);
  }

  bool isThemeDark() => themeData == ThemeConf.dark ? true : false;
}
