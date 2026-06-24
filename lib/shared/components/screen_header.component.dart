import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/shared/components/circle_icon.component.dart';
import 'package:velocity_x/velocity_x.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    super.key,
    required this.title,
    required this.leading,
    this.withBack = false,
  });

  final String title;
  final Widget leading;
  final bool withBack;

  @override
  Widget build(BuildContext context) {
    return row([
      if (withBack)
        CircleIcon(
          icon: FontAwesomeIcons.chevronLeft,
        ).onInkTap(() => Get.back()).paddingOnly(right: 16),
      cTitleMedium(context, title, color: colorScheme(context).onSurface),
      const Spacer(),
      leading,
    ]);
  }
}
