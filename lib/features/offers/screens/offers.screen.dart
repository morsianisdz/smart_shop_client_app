import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/offers/components/offer_item.component.dart';
import 'package:smart_shop_client_app/features/offers/components/offers_tag.component.dart';
import 'package:smart_shop_client_app/features/offers/providers/offer.provider.dart';
import 'package:smart_shop_client_app/shared/components/screen_header.component.dart';
import 'package:velocity_x/velocity_x.dart';

class WeeklyOffersView extends StatelessWidget {
  const WeeklyOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OfferProvider offerProvider = context.read<OfferProvider>();

    return col([
      ScreenHeader(
        title: AppText.offers.tr,
        leading: CTag(
          text: AppText.xclipped.trArgs(["0"]),
          color: colorScheme(context).onSurface,
        ),
      ).paddingOnly(bottom: 16),
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offerProvider.categories.length,
        itemBuilder: (context, index) {
          return OffersTag(offerProvider: offerProvider, index: index);
        },
      ).h(38).paddingOnly(bottom: 20),

      ListView.builder(
        itemCount: offerProvider.offers.length,
        itemBuilder: (context, index) =>
            OfferItem(item: offerProvider.offers[index]),
      ).expand(),
    ], calign: CrossAxisAlignment.start).paddingSymmetric(horizontal: 16);
  }
}
