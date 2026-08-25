import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/features/home/components/progress_indicator.component.dart';
import 'package:smart_shop_client_app/shared/helpers/price_builder.helper.dart';
import 'package:smart_shop_client_app/shared/providers/cart.provider.dart';
import 'package:smart_shop_client_app/shared/providers/user.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ActiveShoppingLimit extends StatelessWidget {
  const ActiveShoppingLimit({super.key});

  @override
  Widget build(BuildContext context) {
    double limit = GetIt.instance<UserProvider>().user!.activeShoppingLimit;
    limit = 75;
    GetIt.instance<CartProvider>().totalPrice = 43;
    return Card(
          child: limit == 0 ? col([
            cTitleSmall(
                    context,
                    AppText.activeShoppingLimit.tr.toUpperCase(),
                    fontFamily: ThemeConf.secondaryFontFamily,
                  ),
            CButton.textOnly((){}, cTitleSmall(context, AppText.setALimit.tr, color: ColorsConf.textWhite)).w(100).h(50)
          ], calign: CrossAxisAlignment.start).paddingAll(16) : col([
            row([
                  cTitleSmall(
                    context,
                    AppText.activeShoppingLimit.tr.toUpperCase(),
                    fontFamily: ThemeConf.secondaryFontFamily,
                  ),
                  cBodyMedium(
                    context,
                    AppText.xused.trArgs([((GetIt.instance<CartProvider>().totalPrice/limit)*100).toStringAsFixed(2)]),
                    color: colorScheme(context).primary,
                  ),
                ], align: MainAxisAlignment.spaceBetween)
                .paddingOnly(bottom: 8),
            row([
                  cTitleLarge(
                    context,
                    priceBuilder(GetIt.instance<CartProvider>().totalPrice),
                  ).paddingOnly(right: 4),
                  cBodyMedium(
                    context,
                    AppText.amountLimit.trArgs([priceBuilder(limit)]),
                  ),
                ], calign: CrossAxisAlignment.end)
                .paddingOnly(bottom: 16),
            CProgressIndicator(
              value: GetIt.instance<CartProvider>().totalPrice/limit,
              color: colorScheme(context).primary,
            ).paddingOnly(bottom: 8),

            row([
              cBodyMedium(
                context,
                AppText.xRemaining.trArgs([priceBuilder(limit - GetIt.instance<CartProvider>().totalPrice)]),
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