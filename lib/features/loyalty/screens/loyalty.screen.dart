import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/features/loyalty/components/coupon_wrap_layout.component.dart';
import 'package:smart_shop_client_app/features/loyalty/components/rewards_carrosel_section.component.dart';
import 'package:smart_shop_client_app/shared/components/circle_icon.component.dart';
import 'package:velocity_x/velocity_x.dart';

class Loyalty extends StatelessWidget {
  const Loyalty({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: col([
        row([
          cTitleMedium(
            context,
            AppText.loyaltyRewardsHub.tr,
            color: colorScheme(context).onSurface,
          ),
          FaIcon(
            FontAwesomeIcons.circleInfo,
            size: 16,
            color: colorScheme(context).onPrimaryContainer,
          ),
        ], align: MainAxisAlignment.spaceBetween).paddingOnly(
          top: 48,
          bottom: 16,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UiConf.cardBorderRadius),
            side: BorderSide(color: ColorsConf.gold, width: 0.5),
          ),
          child: col([
            row(
              [
                col([
                  cBodyMedium(
                    context,
                    AppText.yourBalance.tr.toUpperCase(),
                    fontFamily: ThemeConf.secondaryFontFamily,
                  ).paddingOnly(bottom: 12),
                  row([
                    cTitleLarge(context, "420").paddingOnly(right: 8),
                    cTitleSmall(context, AppText.pts.tr),
                  ], calign: CrossAxisAlignment.end).paddingOnly(bottom: 12),
                  row([
                    FaIcon(
                      FontAwesomeIcons.medal,
                      color: ColorsConf.gold,
                      size: 16,
                    ).paddingOnly(right: 8),
                    cTitleSmall(
                      context,
                      AppText.goldTierMember.tr,
                      color: ColorsConf.gold,
                    ),
                  ]).paddingOnly(bottom: 16),
                ], calign: CrossAxisAlignment.start),
                CircleIcon(
                  icon: FontAwesomeIcons.crown,
                  color: ColorsConf.gold,
                ),
              ],
              calign: CrossAxisAlignment.start,
              align: MainAxisAlignment.spaceBetween,
            ),
            CButton.withIcon(
              () {},
              cTitleMedium(
                context,
                AppText.tapToScanMemberCard.tr,
                color: colorScheme(context).primaryContainer,
              ),
              backgroundColor: colorScheme(context).onSurface,
              icon: FaIcon(
                FontAwesomeIcons.qrcode,
                color: colorScheme(context).primaryContainer,
              ),
            ).h(45),
          ]).p(16),
        ).paddingOnly(bottom: 16),
        cTitleSmall(
          context,
          AppText.availableRedemptions.tr.toUpperCase(),
          fontFamily: ThemeConf.secondaryFontFamily, fontWeight: FontWeight.bold
        ).paddingOnly(bottom: 16),
        RewardCarouselSection().paddingOnly(bottom: 16),
        cTitleSmall(
          context,
          AppText.weeklyDigitalCoupons.tr.toUpperCase(),
          fontFamily: ThemeConf.secondaryFontFamily, fontWeight: FontWeight.bold
        ).paddingOnly(bottom: 16),
        CouponWrapLayout(coupons: FakeData.coupons)
      ], calign: CrossAxisAlignment.start),
    ).paddingSymmetric(horizontal: 16);
  }
}
