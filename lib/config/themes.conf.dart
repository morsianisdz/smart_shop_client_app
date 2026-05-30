import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';

class ThemeConf {
  static const String fontFamily = 'PlusJakartaSans';
  static const String secondaryFontFamily = 'JetBrainsMono';

  static ColorScheme lightColorS = ColorScheme.light(
    primary: ColorsConf.orange,
    surface: ColorsConf.lightBackground,
    onSurface: ColorsConf.textBlack,
    primaryContainer: ColorsConf.lightContainer,
    onPrimaryContainer: ColorsConf.textdarkGray,
    onSecondaryContainer: ColorsConf.darkgrey,
    brightness: Brightness.light,
  );

  static ColorScheme darkColorS = ColorScheme.dark(
    primary: ColorsConf.orange,
    surface: ColorsConf.darkBackground,
    onSurface: ColorsConf.textWhite,
    primaryContainer: ColorsConf.darkContainer,
    onPrimaryContainer: ColorsConf.textlightGray,
    onSecondaryContainer: ColorsConf.lightgrey,
    brightness: Brightness.light,
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  static TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorsConf.textWhite,
      fontSize: 28,
    ),
    titleMedium: TextStyle(fontSize: 16),
    titleSmall: TextStyle(fontSize: 11),
    bodyLarge: TextStyle(
      color: ColorsConf.textWhite,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(fontSize: 9),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UiConf.inputCornerRadius),
      borderSide: BorderSide.none,
    ),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsConf.orange,
          minimumSize: Size.fromHeight(UiConf.elevatedButtonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              UiConf.elevatedButtonBorderRadius,
            ),
          ),
        ),
      );

  static IconThemeData iconThemeData = IconThemeData(color: ColorsConf.orange);

  static BottomSheetThemeData bottomSheetThemeData = const BottomSheetThemeData(
    elevation: 0,
    backgroundColor: Colors.transparent,
  );

  static IconThemeData primaryIconTheme = IconThemeData(size: UiConf.iconWith);

  static ThemeData light = ThemeData(
    fontFamily: fontFamily,
    colorScheme: lightColorS,
    iconTheme: iconThemeData,
    textTheme: textTheme,
    brightness: Brightness.light,
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    bottomSheetTheme: bottomSheetThemeData,
    primaryIconTheme: primaryIconTheme,
  );

  static ThemeData dark = ThemeData(
    fontFamily: fontFamily,
    colorScheme: darkColorS,
    iconTheme: iconThemeData,
    textTheme: textTheme,
    brightness: Brightness.light,
    inputDecorationTheme: inputDecorationTheme,
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    bottomSheetTheme: bottomSheetThemeData,
    primaryIconTheme: primaryIconTheme,
  );
}
