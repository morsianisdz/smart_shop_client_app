import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/core/widgets/input_field.components.dart';
import 'package:smart_shop_client_app/features/home/components/active_shopping_limit.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/home/components/home_header.component.dart';
import 'package:smart_shop_client_app/features/home/components/product_wrap_layout.component.dart';
import 'package:smart_shop_client_app/features/home/components/progress_indicator.component.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return col([
        HomeHeader().paddingOnly(bottom: 18),
        CInputField(
          controller: TextEditingController(),
          prefixIcon: Icon(Icons.search),
          text: AppText.searchProductsBrandsAisles.tr,
        ).paddingOnly(bottom: 16),
        Card(
          child: col([
            row([
                  cTitleSmall(
                    context,
                    AppText.memberStatus.tr.toUpperCase(),
                    fontFamily: ThemeConf.secondaryFontFamily,
                  ),
                  CTag(text: AppText.bronzeTier.tr, color: colorScheme(context).secondary),
                ], align: MainAxisAlignment.spaceBetween)
                .paddingOnly(bottom: 8),
            row([
                  cTitleLarge(context, "150").paddingOnly(right: 4),
                  cTitleSmall(
                    context,
                    AppText.xpoints.tr.toUpperCase(),
                    color: colorScheme(context).secondary,
                    fontWeight: FontWeight.bold
                  ),
                ], calign: CrossAxisAlignment.end)
                .paddingOnly(bottom: 16),
            CProgressIndicator(
              value: 0.6,
              color: colorScheme(context).secondary,
            ).paddingOnly(bottom: 8),

            row([
              cBodyMedium(
                context,
                AppText.xpts.trArgs(["5"]),
                fontFamily: ThemeConf.secondaryFontFamily,
              ),
              cBodyMedium(
                context,
                AppText.newRewardx.trArgs(["258"]),
                fontFamily: ThemeConf.secondaryFontFamily,
              ),
            ], align: MainAxisAlignment.spaceBetween),
          ], calign: CrossAxisAlignment.start).paddingAll(16),
        ).paddingOnly(bottom: 16),
        ActiveShoppingLimit().paddingOnly(bottom: 18),
        CButton.withIcon(
          () {},
          cTitleSmall(
            context,
            AppText.startInStoreScanning.tr.toUpperCase(),
            color: ColorsConf.textWhite,
            fontWeight: FontWeight.bold
          ),
          icon: FaIcon(
            FontAwesomeIcons.barcode,
            color: ColorsConf.textWhite,
          ),
        ).paddingOnly(bottom: 24),
        row([
              cTitleSmall(
                context,
                AppText.mySavedOffers.tr.toUpperCase(),
                fontFamily: ThemeConf.secondaryFontFamily,
              ),
              cTitleSmall(
                context,
                AppText.seeAll.tr,
                fontFamily: ThemeConf.secondaryFontFamily,
                color: colorScheme(context).primary,
                fontWeight: FontWeight.bold,
              ).onTap(() {}),
            ], align: MainAxisAlignment.spaceBetween)
            .paddingOnly(bottom: 12),
            ProductWrapLayout(products: FakeData.products)
      ]).paddingSymmetric(horizontal: 16).scrollVertical();
  }
}
