import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/home/components/user_avatar.component.dart';
import 'package:badges/badges.dart' as badges;

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return row([
      UserAvatar().paddingOnly(right: 12),
      col([
        cTitleSmall(
          context,
          AppText.welcome.tr.toUpperCase(),
          fontFamily: ThemeConf.secondaryFontFamily,
        ),
        cTitleMedium(
          context,
          AppText.hello.trArgs(["John"]),
          color: colorScheme(context).onSurface,
        ),
      ]),
      const Spacer(),
      row([
        badges.Badge(
          badgeContent: Text("3"),
          child: FaIcon(
            FontAwesomeIcons.bell,
            color: colorScheme(context).onPrimaryContainer,
            size: UiConf.iconHeight,
          ),
        ).paddingOnly(right: 20),
        badges.Badge(
          badgeContent: Text("3"),
          child: FaIcon(
            FontAwesomeIcons.basketShopping,
            color: colorScheme(context).onPrimaryContainer,
            size: UiConf.iconHeight,
          ),
        ),
      ]),
    ]);
  }
}
