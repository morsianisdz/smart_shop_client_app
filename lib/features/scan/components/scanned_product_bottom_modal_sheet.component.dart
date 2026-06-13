import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/scan/components/drag_handle.component.dart';
import 'package:smart_shop_client_app/shared/helpers/price_builder.helper.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';
import 'package:velocity_x/velocity_x.dart';

class ScannedProductBottomModalSheet extends StatelessWidget {
  const ScannedProductBottomModalSheet({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme(context).primaryContainer, // Dark background color
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      child: col([
        DragHandle().paddingOnly(bottom: 24),
        row([
          col([
            if (product.tag != null)
              CTag(
                text: product.tag!,
                color: colorScheme(context).tertiary,
              ).paddingOnly(bottom: 8),
            cTitleLarge(
              context,
              product.name,
              color: colorScheme(context).onSurface,
            ).paddingOnly(bottom: 8),
            cTitleSmall(context, AppText.eanBarecode.trArgs([product.barcode])),
          ], calign: CrossAxisAlignment.start),
          col([
            cTitleLarge(
              context,
              priceBuilder(product.price.toString()),
              color: colorScheme(context).primary,
            ).paddingOnly(bottom: 8),
            cTitleSmall(context, AppText.inAisleX.trArgs(["4B"])),
          ]),
        ], align: MainAxisAlignment.spaceBetween, calign: CrossAxisAlignment.end),
        Divider(color: colorScheme(context).onSecondaryContainer, height: 32),
        [
              cTitleSmall(context, AppText.addQuantity.tr),
              row([
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.minus,
                    color: colorScheme(context).onSurface,
                    size: 18,
                  ),
                ),
                cTitleLarge(
                  context,
                  product.qty.toString(),
                  fontFamily: ThemeConf.secondaryFontFamily,
                ).paddingSymmetric(horizontal: 16),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.plus,
                    color: colorScheme(context).onSurface,
                    size: 18,
                  ),
                ),
              ]),
            ]
            .row(alignment: MainAxisAlignment.spaceBetween)
            .paddingOnly(bottom: 24),
        [
              cTitleSmall(context, AppText.expectedSubTotal.tr),
              cTitleMedium(
                context,
                priceBuilder(product.price.toString()),
                color: colorScheme(context).onSurface,
              ),
            ]
            .row(alignment: MainAxisAlignment.spaceBetween)
            .paddingOnly(bottom: 24),

        row([
          CButton.textOnly(
            () {},
            cTitleMedium(
              context,
              AppText.cancel.tr.toUpperCase(),
              color: colorScheme(context).onSurface,
            ),
            backgroundColor: colorScheme(context).onSurface.withValues(alpha: 0.1)
          ).paddingOnly(right: 16).expand(),
          CButton.textOnly(
            () {},
            cTitleMedium(
              context,
              AppText.addToCart.tr.toUpperCase(),
              color: colorScheme(context).onSurface,
            )
          ).expand()
        ]),
      ], size: MainAxisSize.min),
    );
  }
}
