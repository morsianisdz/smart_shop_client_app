import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthDevider extends StatelessWidget {
  const AuthDevider({super.key});

  @override
  Widget build(BuildContext context) {
    return [
    Divider(
      color: colorScheme(context).onSecondaryContainer,
      thickness: 1,
    ).expand(),
    cTitleSmall(
      context,
      AppText.orSignInWith.tr,
      fontFamily: ThemeConf.secondaryFontFamily,
    ).paddingSymmetric(horizontal: 16),
    Divider(
      color: colorScheme(context).onSecondaryContainer,
      thickness: 1,
    ).expand(),
  ].row();
  }
}