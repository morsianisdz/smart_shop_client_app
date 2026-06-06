import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';

class CTag extends StatelessWidget {
  const CTag({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(UiConf.tagBorderRadius),
    ),
    child: cBodySmall(
      context,
      text,
      color: color,
    ).paddingSymmetric(horizontal: 9, vertical: 4),
  );
}
