import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/paths.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';

Widget icon(String name) {
  return Image.asset(
    "${PathConf.iconsPath}$name",
    matchTextDirection: true,
    width: UiConf.iconWith,
    height: UiConf.iconHeight,
  );
}