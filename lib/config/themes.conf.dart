import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';

class ThemeConf {

  static const String fontFamily = 'PlusJakartaSans';
  static const String secondaryFontFamily = 'JetBrainsMono';

  static ColorScheme lightColorS = ColorScheme.light(
    primary: ColorsConf.orange,
    secondary: ColorsConf.blue,
    tertiary: ColorsConf.green,
    surface: ColorsConf.lightBackground,
    onSurface: ColorsConf.textBlack,
    primaryContainer: ColorsConf.lightContainer,
    onPrimaryContainer: ColorsConf.textdarkGray,
    onSecondaryContainer: ColorsConf.darkgrey,
    brightness: Brightness.light,
  );

  static ColorScheme darkColorS = ColorScheme.dark(
    primary: ColorsConf.orange,
    secondary: ColorsConf.blue,
    tertiary: ColorsConf.green,
    surface: ColorsConf.darkBackground,
    onSurface: ColorsConf.textWhite,
    primaryContainer: ColorsConf.darkContainer,
    onPrimaryContainer: ColorsConf.textlightGray,
    onSecondaryContainer: ColorsConf.lightgrey,
    brightness: Brightness.dark,
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  static TextTheme _buldTextTheme(ColorScheme colorScheme) => TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: UiConf.titleLargeFontSize,
      color: colorScheme.onSurface,
    ),
    titleMedium: TextStyle(
      fontSize: UiConf.titleMediumFontSize,
      color: colorScheme.onPrimaryContainer,
    ),
    titleSmall: TextStyle(
      fontSize: UiConf.titleSmallFontSize,
      color: colorScheme.onPrimaryContainer,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: UiConf.bodyLargeFontSize,
      color: colorScheme.onPrimaryContainer,
    ),
    bodyMedium: TextStyle(
      fontSize: UiConf.bodyMediumFontSize,
      color: colorScheme.onPrimaryContainer,
    ),
    bodySmall: TextStyle(
      fontSize: UiConf.bodySmallFontSize,
      color: colorScheme.onPrimaryContainer,
    ),
  );

  static InputDecorationTheme _buildInputDecorationTheme(ColorScheme colorScheme) => InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UiConf.inputCornerRadius),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: colorScheme.onSecondaryContainer, fontSize: UiConf.hintFontSize),
    fillColor: colorScheme.primaryContainer,
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

  static BadgeThemeData badgeThemeData = BadgeThemeData(
    backgroundColor: Colors.red,
  );

  static CardThemeData _buildCardTheme(ColorScheme colorScheme) =>
      CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiConf.cardBorderRadius),
          side: BorderSide.none,
        ),
        color: colorScheme.primaryContainer,
        elevation: UiConf.cardElevation,
      );

  static IconButtonThemeData iconButtonThemeBuilder(ColorScheme colorScheme) =>
      IconButtonThemeData(
        style: IconButton.styleFrom(backgroundColor: colorScheme.onSurface.withValues(alpha: 0.1)),
      );
    

  static ThemeData get light => ThemeData(
    fontFamily: fontFamily,
    colorScheme: lightColorS,
    iconTheme: iconThemeData,
    textTheme: _buldTextTheme(lightColorS),
    inputDecorationTheme: _buildInputDecorationTheme(lightColorS),
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    bottomSheetTheme: bottomSheetThemeData,
    primaryIconTheme: primaryIconTheme,
    badgeTheme: badgeThemeData,
    cardTheme: _buildCardTheme(lightColorS),
    iconButtonTheme: iconButtonThemeBuilder(lightColorS)
  );

  static ThemeData get dark => ThemeData(
    fontFamily: fontFamily,
    colorScheme: darkColorS,
    iconTheme: iconThemeData,
    textTheme: _buldTextTheme(darkColorS),
    inputDecorationTheme: _buildInputDecorationTheme(darkColorS),
    appBarTheme: appBarTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    bottomSheetTheme: bottomSheetThemeData,
    primaryIconTheme: primaryIconTheme,
    badgeTheme: badgeThemeData,
    cardTheme: _buildCardTheme(darkColorS),
    iconButtonTheme: iconButtonThemeBuilder(darkColorS)
  );

    static ThemeData currentTheme = dark;
}
