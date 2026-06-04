import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/home/components/home_header.component.dart';
import 'package:smart_shop_client_app/features/home/components/progress_indicator.component.dart';
import 'package:smart_shop_client_app/shared/helpers/price_builder.helper.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: [
        HomeHeader().paddingOnly(top: 48, bottom: 18),
        Card(
          child: [
            [
                  cTitleSmall(
                    context,
                    AppText.memberStatus.tr.toUpperCase(),
                    fontFamily: ThemeConf.secondaryFontFamily,
                  ),
                  CTag(text: AppText.bronzeTier.tr),
                ]
                .row(alignment: MainAxisAlignment.spaceBetween)
                .paddingOnly(bottom: 8),
            [
                  cTitleLarge(context, "150").paddingOnly(right: 4),
                  cTitleMedium(
                    context,
                    AppText.xpoints.tr.toUpperCase(),
                    color: colorScheme(context).secondary,
                  ),
                ]
                .row(crossAlignment: CrossAxisAlignment.end)
                .paddingOnly(bottom: 16),
            CProgressIndicator(
              value: 0.6,
              color: colorScheme(context).secondary,
            ).paddingOnly(bottom: 8),

            [
              cBodySmall(context, AppText.xpts.trArgs(["5"]), fontFamily: ThemeConf.secondaryFontFamily),
              cBodySmall(context, AppText.newRewardx.trArgs(["258"]), fontFamily: ThemeConf.secondaryFontFamily),
            ].row(alignment: MainAxisAlignment.spaceBetween),
          ].column(crossAlignment: CrossAxisAlignment.start).paddingAll(16),
        ).paddingOnly(bottom: 16),
        Card(
          child: [
            [
                  cTitleSmall(
                    context,
                    AppText.activeShoppingLimit.tr.toUpperCase(),
                    fontFamily: ThemeConf.secondaryFontFamily,
                  ),
                  cBodySmall(context, AppText.xused.trArgs(["30"]), color: colorScheme(context).primary)
                ]
                .row(alignment: MainAxisAlignment.spaceBetween)
                .paddingOnly(bottom: 8),
            [
                  cTitleLarge(context, priceBuilder("15.00")).paddingOnly(right: 4),
                  cBodySmall(
                    context,
                    AppText.amountLimit.trArgs([priceBuilder("50.00")])
                  ),
                ]
                .row(crossAlignment: CrossAxisAlignment.end)
                .paddingOnly(bottom: 16),
            CProgressIndicator(
              value: 0.2,
              color: colorScheme(context).primary,
            ).paddingOnly(bottom: 8),

            [
              cBodySmall(context, AppText.xRemaining.trArgs([priceBuilder("35.88")]), fontFamily: ThemeConf.secondaryFontFamily),
              cBodySmall(context, AppText.adjustLimit.tr, fontFamily: ThemeConf.secondaryFontFamily),
            ].row(alignment: MainAxisAlignment.spaceBetween),
          ].column(crossAlignment: CrossAxisAlignment.start).paddingAll(16),
        ),
      ].column().paddingSymmetric(horizontal: 16),
    );
  }
}
