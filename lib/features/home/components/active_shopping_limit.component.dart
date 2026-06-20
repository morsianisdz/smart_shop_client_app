import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/home/components/progress_indicator.component.dart';
import 'package:smart_shop_client_app/shared/helpers/price_builder.helper.dart';

class ActiveShoppingLimit extends StatelessWidget {
  const ActiveShoppingLimit({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
          child: col([
            row([
                  cTitleSmall(
                    context,
                    AppText.activeShoppingLimit.tr.toUpperCase(),
                    fontFamily: ThemeConf.secondaryFontFamily,
                  ),
                  cBodyMedium(
                    context,
                    AppText.xused.trArgs(["30"]),
                    color: colorScheme(context).primary,
                  ),
                ], align: MainAxisAlignment.spaceBetween)
                .paddingOnly(bottom: 8),
            row([
                  cTitleLarge(
                    context,
                    priceBuilder("15.00"),
                  ).paddingOnly(right: 4),
                  cBodyMedium(
                    context,
                    AppText.amountLimit.trArgs([priceBuilder("50.00")]),
                  ),
                ], calign: CrossAxisAlignment.end)
                .paddingOnly(bottom: 16),
            CProgressIndicator(
              value: 0.2,
              color: colorScheme(context).primary,
            ).paddingOnly(bottom: 8),

            row([
              cBodyMedium(
                context,
                AppText.xRemaining.trArgs([priceBuilder("35.88")]),
                fontFamily: ThemeConf.secondaryFontFamily,
              ),
              cBodyMedium(
                context,
                AppText.adjustLimit.tr,
                fontFamily: ThemeConf.secondaryFontFamily,
              ),
            ], align: MainAxisAlignment.spaceBetween),
          ], calign: CrossAxisAlignment.start).paddingAll(16),
        );
  }
}