import 'package:smart_shop_client_app/config/paths.conf.dart';
import 'package:flutter/material.dart';

class ImageBuilderHelper {
  static Widget cover(String name,
      {required double width,
      double? height,
      double dependency = 1,
      BoxFit fit = BoxFit.cover,
      double borderRadius = 0}) {
    return Container(
      height: height ?? width * dependency,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          image: DecorationImage(image: AssetImage(name), fit: fit)),
    );
  }

  static Widget coverUrl(String url,
      {double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      double borderRadius = 0, Color? backgroundColor}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          image: DecorationImage(
              image: NetworkImage(url),
              fit: fit)),
    );
  }

  static Decoration coverDecoration(String name, {BoxFit fit = BoxFit.fill}) =>
      BoxDecoration(
          image: DecorationImage(
              image: AssetImage("${PathConf.imagesPath}$name"), fit: fit));
}
