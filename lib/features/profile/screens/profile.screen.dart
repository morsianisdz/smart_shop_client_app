import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/home/components/user_avatar.component.dart';
import 'package:smart_shop_client_app/features/profile/components/menu_element.component.dart';
import 'package:smart_shop_client_app/shared/components/screen_header.component.dart';
import 'package:smart_shop_client_app/shared/helpers/price_builder.helper.dart';
import 'package:smart_shop_client_app/shared/providers/user.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget devider = Divider(
      color: colorScheme(context).onSecondaryContainer,
      thickness: 0.5,
      height: 0,
    );
    return col([
      ScreenHeader(title: AppText.accountSettings.tr, leading: FaIcon(
          FontAwesomeIcons.gear,
          size: 16,
          color: colorScheme(context).onPrimaryContainer,
        )).paddingOnly(bottom: 16),
      Card(
        child: row([
          UserAvatar(radius: 28).paddingOnly(right: 16),
          col([
            cTitleSmall(
              context,
              GetIt.instance<UserProvider>().user!.username,
              color: colorScheme(context).onSurface,
            ).paddingOnly(bottom: 4),
            cBodyMedium(
              context,
              GetIt.instance<UserProvider>().user!.email,
            ).paddingOnly(bottom: 8),
            CTag(
              text: AppText.bronzeTier.tr.toUpperCase(),
              color: colorScheme(context).secondary,
            ),
          ], calign: CrossAxisAlignment.start),
        ]).p(16),
      ).paddingOnly(bottom: 24),
      cTitleSmall(
        context,
        AppText.shoppingControls.tr.toUpperCase(),
        fontFamily: ThemeConf.secondaryFontFamily,
      ).paddingOnly(bottom: 24),
      Card(
        child: row([
          FaIcon(FontAwesomeIcons.sliders, size: 18).paddingOnly(right: 16),
          col([
            cTitleSmall(
              context,
              AppText.monthlySpendingLimit.tr,
              color: colorScheme(context).onSurface,
            ),
            cBodyMedium(
              context,
              AppText.currentCapX.trArgs([priceBuilder(50)]),
            ),
          ], calign: CrossAxisAlignment.start),
          const Spacer(),
          cTitleSmall(
            context,
            AppText.adjust.tr.toUpperCase(),
            color: colorScheme(context).primary,
          ),
        ]).p(16),
      ).paddingOnly(bottom: 24),
      cTitleSmall(
        context,
        AppText.preferencesData.tr.toUpperCase(),
        fontFamily: ThemeConf.secondaryFontFamily,
      ).paddingOnly(bottom: 24),
      Card(
        child: col([
          MenuElement(
            icon: FontAwesomeIcons.receipt,
            text: AppText.purchaseHistory.tr,
          ).p16(),
          devider,
          MenuElement(
            icon: FontAwesomeIcons.creditCard,
            text: AppText.paymentMethods.tr,
          ).p16(),
          devider,
          MenuElement(
            icon: FontAwesomeIcons.bell,
            text: AppText.notificationAlerts.tr,
          ).p16(),
        ]),
      ).paddingOnly(bottom: 24),
      CButton.textOnly(
        () {},
        cTitleSmall(
          context,
          AppText.logOutConfigurationSession.tr.toUpperCase(),
          color: colorScheme(context).error,
        ),
        backgroundColor: colorScheme(context).error.withValues(alpha: 0.2),
      ),
    ], calign: CrossAxisAlignment.start).paddingSymmetric(horizontal: 16);
  }
}
