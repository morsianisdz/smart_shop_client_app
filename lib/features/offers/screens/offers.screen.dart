import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/image_builder.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/auth/components/auth_devider.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/offers/providers/offer.provider.dart';
import 'package:smart_shop_client_app/shared/components/screen_header.component.dart';
import 'package:velocity_x/velocity_x.dart';

class WeeklyOffersView extends StatelessWidget {
  const WeeklyOffersView({Key? key}) : super(key: key);

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
      // 1. Horizontal Category Filter Row
      SizedBox(
        height: 38,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: offerProvider.categories.length,
          itemBuilder: (context, index) {
            final cat = offerProvider.categories[index];
            final isSelected = cat == offerProvider.selectedCategory;
            return Container(
              margin: const EdgeInsets.only(right: 8.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme(context).primary
                    : colorScheme(context).secondaryContainer,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: cBodyMedium(
                  context,
                  cat,
                  color: isSelected
                      ? ColorsConf.textWhite
                      : colorScheme(context).onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).onInkTap(() => offerProvider.onCatTap(cat));
          },
        ),
      ).paddingOnly(bottom: 20),

      Expanded(
        child: ListView.builder(
          itemCount: offerProvider.offers.length,
          itemBuilder: (context, index) {
            final item = offerProvider.offers[index];
            return Card(
              child: col([
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dynamic Product Icon Box
                    ImageBuilderHelper.coverUrl(
                      item.product.image!.url,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 14.0),

                    // Text Descriptions
                    col([
                      row([
                        cTitleSmall(
                          context,
                          item.title,
                          color: colorScheme(context).onSurface,
                        ),
                        cTitleSmall(
                          context,
                          item.discountTag,
                          fontFamily: ThemeConf.secondaryFontFamily,
                          color: colorScheme(context).primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ], align: MainAxisAlignment.spaceBetween).paddingOnly(
                        bottom: 6,
                      ),
                      cTitleSmall(context, item.description),
                    ], calign: CrossAxisAlignment.start).expand(),
                  ],
                ).paddingOnly(bottom: 16),
                Divider(
                  color: colorScheme(context).onSecondaryContainer,
                  thickness: 1,
                ).paddingOnly(bottom: 16),

                // Bottom Row: Expiry information and Clip Offer Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cBodyMedium(
                      context,
                      item.expirationText,
                      fontFamily: ThemeConf.secondaryFontFamily,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: item.isClipped
                            ? const Color(0xFF10B981).withOpacity(0.15)
                            : const Color(0xFF1F2937),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: item.isClipped
                              ? const Color(0xFF10B981).withOpacity(0.3)
                              : Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item.isClipped
                                ? Icons.check_rounded
                                : Icons.link_rounded,
                            color: item.isClipped
                                ? const Color(0xFF10B981)
                                : Colors.white,
                            size: 13,
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            item.isClipped ? "CLIPPED" : "CLIP OFFER",
                            style: TextStyle(
                              color: item.isClipped
                                  ? const Color(0xFF10B981)
                                  : Colors.white,
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'JetBrains Mono',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ], calign: CrossAxisAlignment.start).p16(),
            );
          },
        ),
      ),
    ], calign: CrossAxisAlignment.start).paddingSymmetric(horizontal: 16);
  }
}
