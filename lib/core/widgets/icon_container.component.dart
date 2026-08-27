import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class IconContainer extends StatelessWidget {
  const IconContainer(
      {super.key, required this.data, required this.backgroundColor, this.iconColor});

  final Color backgroundColor;
  final FaIcon data;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: data.centered());
  }
}
