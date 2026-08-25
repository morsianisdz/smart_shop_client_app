import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/cart/screens/cart.screen.dart';
import 'package:smart_shop_client_app/features/home/components/user_avatar.component.dart';
import 'package:badges/badges.dart' as badges;
import 'package:smart_shop_client_app/features/notifications/screens/notifications.dart';
import 'package:smart_shop_client_app/shared/models/user.model.dart';
import 'package:smart_shop_client_app/shared/providers/user.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.user});

  final User user;

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
          AppText.hello.trArgs([GetIt.instance<UserProvider>().user!.username]),
          color: colorScheme(context).onSurface,
        ),
      ], calign: CrossAxisAlignment.start),
      const Spacer(),
      row([
        badges.Badge(
          badgeContent: cBodyMedium(
            context,
            "3",
            color: ColorsConf.textWhite,
            fontWeight: FontWeight.bold,
          ),
          child: FaIcon(
            FontAwesomeIcons.bell,
            color: colorScheme(context).onPrimaryContainer,
            size: UiConf.iconHeight,
          ),
        ).paddingOnly(right: 20).onInkTap(() => Get.to(() => NotificationsScreen())),
        badges.Badge(
          badgeContent: cBodyMedium(
            context,
            "3",
            color: ColorsConf.textWhite,
            fontWeight: FontWeight.bold,
          ),
          child: FaIcon(
            FontAwesomeIcons.basketShopping,
            color: colorScheme(context).onPrimaryContainer,
            size: UiConf.iconHeight,
          ),
        ).onInkTap(() => Get.to(() => CartScreen())),
      ]),
    ]);
  }
}
