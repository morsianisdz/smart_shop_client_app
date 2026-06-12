import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';

class MenuElement extends StatelessWidget {
  const MenuElement({super.key, required this.icon, required this.text});

  final FaIconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return row([
              FaIcon(
                icon,
                size: 14,
                color: colorScheme(context).onPrimaryContainer,
              ).paddingOnly(right: 16),
              cTitleSmall(
                context,
                text,
                color: colorScheme(context).onSurface,
              ),
              const Spacer(),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                size: 12,
                color: colorScheme(context).onSecondaryContainer,
              ).paddingOnly(right: 16),
            ]);
  }
}