import 'dart:ui';

import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';

class UiConf {
  //input text
  static const double inputHintTextFontSize = 14;
  static const double inputCornerRadius = 16;
  static const double hintFontSize = 16;
  static const double errorTextFontSize = 14;

  //button
  static const double buttonHeight = 40;
  static const double buttonBorderRadius = 10;
  static const double sizeBetweenContent = 5;
  static double elevatedButtonHeight = 54;
  static double elevatedButtonBorderRadius = 12;

  //icons
  static double? iconWith = 24;
  static double? iconHeight = 24;

  //user avatar
  static double? userAvatarRadius = 24;

  //fonts size
  static double titleLargeFontSize = 22;
  static double titleMediumFontSize = 18;
  static double titleSmallFontSize = 14;
  static double bodyLargeFontSize = 18;
  static double bodyMediumFontSize = 12;
  static double bodySmallFontSize = 9;

  //card
  static double cardBorderRadius = 16;
  static double cardBorderSideWith = 0;
  static double? cardElevation = 0;

  //tag
  static double tagBorderRadius = 5;
  static double tagBorderWidth = 0;

  //bottom navigation bar
  static const double navBarMargin = 16.0;
  static const double navBarCornerRadius = 16;
  static const double navBarHorizontalPadding = 8.0;
  static const double navBarIconSize = 18.0;
  static const double navBarLabelSpacing = 4.0;
  static const double navBarItemCornerRadius = 16.0;
  static const double navBarItemHorizontalPadding = 12.0;
  static const double navBarItemVerticalPadding = 12.0;

  //snack position
  static Color failedColor = ColorsConf.red;
  static Color successColor = ColorsConf.green;
  static SnackPosition snackPosition = SnackPosition.BOTTOM;
  static double maxWidth = 200;
}