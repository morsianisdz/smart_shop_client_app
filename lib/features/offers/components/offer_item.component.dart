import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/constants/image.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/image_builder.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/offers/models/coupon_off.model.dart';
import 'package:velocity_x/velocity_x.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({super.key, required this.item});

  final CouponOfferModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: col([
        row([
          ImageBuilderHelper.coverUrl(
            item.product.image!.url ?? ImageData.itemPlaceholder,
            width: 50,
            height: 50,
          ).paddingOnly(bottom: 14),

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
            ], align: MainAxisAlignment.spaceBetween).paddingOnly(bottom: 6),
            cTitleSmall(context, item.description),
          ], calign: CrossAxisAlignment.start).expand(),
        ], calign: CrossAxisAlignment.start).paddingOnly(bottom: 16),
        Divider(
          color: colorScheme(context).onSecondaryContainer,
          thickness: 1,
        ).paddingOnly(bottom: 16),

        row([
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
                  ? colorScheme(context).tertiary.withValues(alpha: 0.15)
                  : colorScheme(context).secondaryContainer,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: item.isClipped
                    ? colorScheme(context).tertiary.withValues(alpha: 0.3)
                    : Colors.transparent,
                width: 1.0,
              ),
            ),
            child: row([
              FaIcon(
                item.isClipped
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.paperclip,
                color: item.isClipped
                    ? colorScheme(context).tertiary
                    : ColorsConf.textWhite,
                size: 13,
              ).paddingOnly(right: 6),
              cBodyMedium(
                context,
                item.isClipped ? AppText.clipped.tr : AppText.clippOffer.tr,
                fontFamily: ThemeConf.secondaryFontFamily,
                color: item.isClipped
                    ? colorScheme(context).tertiary
                    : ColorsConf.textWhite,
              ),
            ]),
          ),
        ], align: MainAxisAlignment.spaceBetween),
      ], calign: CrossAxisAlignment.start).p16(),
    );
  }
}
