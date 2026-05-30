import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = ThemeConf.dark;

  void toggleTheme() {
    themeData =
        (themeData == ThemeConf.light) ? ThemeConf.dark : ThemeConf.light;
    notifyListeners();
  }
}
