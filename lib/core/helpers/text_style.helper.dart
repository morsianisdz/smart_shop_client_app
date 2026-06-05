import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget cTitleMedium(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily,
}) => text.text
    .textStyle(
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontFamily: fontFamily,
      ),
    )
    .make();

Widget cTitleLarge(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily,
}) => text.text
    .textStyle(
      Theme.of(context).textTheme.titleLarge!.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontFamily: fontFamily,
      ),
    )
    .make();

Widget cTitleSmall(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily,
}) => text.text
    .textStyle(
      Theme.of(context).textTheme.titleSmall!.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    )
    .make();

Widget cBodyMedium(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily,
}) => Text(text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );

Widget cBodySmall(
  BuildContext context,
  String text, {
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily,
}) => Text(text, style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
