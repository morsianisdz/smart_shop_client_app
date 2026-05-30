import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget titleMedium(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily
}) => text.text
    .textStyle(
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimaryContainer,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontFamily: fontFamily
      ),
    )
    .make();

Widget titleLarge(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily
}) => text.text
    .textStyle(
      Theme.of(context).textTheme.titleLarge!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onSurface,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontFamily: fontFamily
      ),
    )
    .make();

Widget titleSmall(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily
}) => text.text
    .textStyle(
      Theme.of(context).textTheme.titleSmall!.copyWith(
        color: color ?? Theme.of(context).colorScheme.onPrimaryContainer,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontFamily: fontFamily
      ),
    )
    .make();
