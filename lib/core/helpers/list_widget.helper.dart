import 'package:flutter/material.dart';

Widget col(
  List<Widget> widgets, {
  MainAxisAlignment align= MainAxisAlignment.start,
  MainAxisSize size = MainAxisSize.max,
  CrossAxisAlignment calign = CrossAxisAlignment.center,
  double spacing = 0.0,
}) => Column(
  mainAxisAlignment: align,
  crossAxisAlignment: calign,
  mainAxisSize: size,
  children: widgets,
);

Widget row(
  List<Widget> widgets, {
  MainAxisAlignment align = MainAxisAlignment.start,
  MainAxisSize size = MainAxisSize.max,
  CrossAxisAlignment calign = CrossAxisAlignment.center,
  double spacing = 0.0,
}) => Row(
  mainAxisAlignment: align,
  crossAxisAlignment: calign,
  mainAxisSize: size,
  children: widgets,
);
