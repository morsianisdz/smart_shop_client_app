import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/shared/components/circle_icon.component.dart';
import 'package:velocity_x/velocity_x.dart';

class ScanHeader extends StatelessWidget {
  const ScanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return row([
      CircleIcon(
        icon: FontAwesomeIcons.bolt,
        isActive: true,
      ).paddingOnly(right: 12),

      Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme(context).primaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: cTitleSmall(
          context,
          AppText.aisleXY.trArgs(["4B", "BREAKFAST"]).toUpperCase(),
        ).centered(),
      ).paddingOnly(right: 12).expand(),

      CircleIcon(
        icon: FontAwesomeIcons.keyboard,
        isActive: false,
      ).paddingOnly(right: 12),
    ]).paddingSymmetric(horizontal: 16, vertical: 8).h(60);
  }
}
