import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';

class CTag extends StatelessWidget {
  const CTag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: colorScheme(context).secondary.withValues(alpha: 0.1),
      border: Border.all(color: colorScheme(context).secondary, width: UiConf.tagBorderWidth),
      borderRadius: BorderRadius.circular(UiConf.tagBorderRadius),
    ),
    child: cBodySmall(
      context,
      text,
      color: colorScheme(context).secondary,
    ).paddingSymmetric(horizontal: 12, vertical: 6),
  );
}
