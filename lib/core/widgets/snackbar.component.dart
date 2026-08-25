import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';

class CSnackBar {
  static final Color _textColor = ColorsConf.textWhite;
  static final SnackPosition _snackbarPosition = UiConf.snackPosition;

  static failed(String message) {
    Get.snackbar(
      duration: Duration(seconds: 10),
      AppText.error,
      message,
      backgroundColor: UiConf.failedColor,
      snackPosition: _snackbarPosition,
      colorText: _textColor,
      maxWidth: UiConf.maxWidth,
      margin: EdgeInsets.all(10)
    );
  }

  static success(String message) {
    Get.snackbar(
      AppText.success,
      message,
      backgroundColor: UiConf.successColor,
      snackPosition: _snackbarPosition,
      colorText: _textColor,
      maxWidth: UiConf.maxWidth,
    );
  }
}
