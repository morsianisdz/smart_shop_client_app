import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/home/components/progress_indicator.component.dart';
import 'package:smart_shop_client_app/features/loyalty/components/point_ledger_history_element.component.dart';
import 'package:smart_shop_client_app/features/loyalty/components/rewards_carrosel_section.component.dart';
import 'package:smart_shop_client_app/features/profile/components/menu_element.component.dart';
import 'package:velocity_x/velocity_x.dart';

class Loyalty extends StatelessWidget {
  const Loyalty({super.key});

  @override
  Widget build(BuildContext context) {
    return col([
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
          child: col([
            row([
              cBodyMedium(
                context,
                AppText.memberStatus.tr.toUpperCase(),
                fontFamily: ThemeConf.secondaryFontFamily,
              ),
              CTag(text: AppText.bronzeTier.tr, color: ColorsConf.gold),
            ], align: MainAxisAlignment.spaceBetween).paddingOnly(bottom: 8),
            row([
              cTitleLarge(context, "320").paddingOnly(right: 4),
              cTitleSmall(context, AppText.pts.tr, color: ColorsConf.gold),
            ], calign: CrossAxisAlignment.end).paddingOnly(bottom: 16),
            row([
              cTitleSmall(context, AppText.progressToSilverTier.tr),
              cBodyMedium(
                context,
                AppText.xToYPts.trArgs(["300", "500"]),
                color: colorScheme(context).onSurface,
              ),
            ], align: MainAxisAlignment.spaceBetween).paddingOnly(bottom: 8),
            CProgressIndicator(
              value: 0.6,
              color: ColorsConf.gold,
            ).paddingOnly(bottom: 8),
          ], calign: CrossAxisAlignment.start).paddingAll(16),
        ).paddingOnly(bottom: 16),
        Card(
          child: MenuElement(
            icon: FontAwesomeIcons.qrcode,
            text: AppText.tapToScanMemberCard.tr,
          ).p16(),
        ).paddingOnly(bottom: 16),
        cTitleSmall(
          context,
          AppText.milestoneRewardsTrack.tr.toUpperCase(),
          fontFamily: ThemeConf.secondaryFontFamily,
          fontWeight: FontWeight.bold,
        ).paddingOnly(bottom: 16),
        RewardCarouselSection().paddingOnly(bottom: 16),
        cTitleSmall(
          context,
          AppText.pointsLedgerHistory.tr.toUpperCase(),
          fontFamily: ThemeConf.secondaryFontFamily,
          fontWeight: FontWeight.bold,
        ).paddingOnly(bottom: 16),
        Card(
          child: col(
            FakeData.mockLedgerHistory
                .mapIndexed(
                  (mockLedgerEelement, index) => PointLedgerHistoryEelement(
                    pointLedger: mockLedgerEelement, isLastEelement: (FakeData.mockLedgerHistory.length - index - 1) == 0,
                  ),
                )
                .toList(),
          ),
        ),
      ], calign: CrossAxisAlignment.start).paddingSymmetric(horizontal: 16).scrollVertical();
  }
}
