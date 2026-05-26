import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';

class ThemeConf {
  static const String fontFamily = 'Inter';

  static AppBarTheme appBarTheme =
      const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0);

  static TextTheme textTheme = TextTheme(
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold, color: ColorsConf.title, fontSize: 28),
      titleMedium: TextStyle(
          fontWeight: FontWeight.bold, color: ColorsConf.textGray, fontSize: 24),
      bodyLarge: TextStyle(
          color: ColorsConf.title, fontWeight: FontWeight.bold, fontSize: 18),
      bodyMedium: TextStyle(
          color: ColorsConf.textGray, fontWeight: FontWeight.bold, fontSize: 16));

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      contentPadding: const EdgeInsets.all(UiConf.inputFieldContentPadding),
      hintStyle: const TextStyle(
          fontWeight: FontWeight.normal, fontSize: UiConf.inputHintTextFontSize));

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(UiConf.buttonHeight),
              elevation: 0, backgroundColor: ColorsConf.orange, shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UiConf.buttonBorderRadius), // Adjust the radius as needed
    ),));

  static DialogThemeData dialogTheme = const DialogThemeData(
    shape: RoundedRectangleBorder(),
    alignment: Alignment.center,
    insetPadding: EdgeInsets.all(20),
    
  );

  static DropdownMenuThemeData dropdownMenuThemeData = const DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      outlineBorder: BorderSide.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    )
  );

  static IconThemeData iconThemeData = IconThemeData(color: ColorsConf.orange);

  static BottomSheetThemeData bottomSheetThemeData = const BottomSheetThemeData(elevation: 0, backgroundColor: Colors.transparent);

  static ThemeData light = ThemeData(
    primaryColor: ColorsConf.orange,
    iconTheme: iconThemeData,
    textTheme: textTheme,
    brightness: Brightness.light,
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    dialogTheme: dialogTheme,
    dropdownMenuTheme: dropdownMenuThemeData,
    bottomSheetTheme: bottomSheetThemeData
  );

  static ThemeData dark = ThemeData(
    primaryColor: ColorsConf.orange,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    brightness: Brightness.dark,
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    dialogTheme: dialogTheme,
    dropdownMenuTheme: dropdownMenuThemeData
  );
}
