import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/image_builder.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/shared/helpers/price_builder.helper.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';
import 'package:smart_shop_client_app/shared/providers/cart.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.cartProvider,
  });

  final Product product;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: row([
        ImageBuilderHelper.coverUrl(
          product.image!.url,
          width: 50,
          height: 50,
        ).paddingOnly(right: 12),
        col([
          row([
            col([
              cTitleSmall(context, product.name),
              if (product.tag != null)
                cBodySmall(
                  context,
                  product.tag!,
                  color: colorScheme(context).primary,
                  fontWeight: FontWeight.bold,
                ),
            ], calign: CrossAxisAlignment.start),
            cTitleSmall(context, priceBuilder(product.price), color: colorScheme(context).onSurface)
          ], align: MainAxisAlignment.spaceBetween),
          row([
            cBodyMedium(
              context,
              AppText.unit.tr,
            ),
            cBodyMedium(
              context,
              priceBuilder(product.price)
            ),
            if (product.oldPrice != null)
              priceBuilder(product.oldPrice!).text
                  .textStyle(
                    TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: colorScheme(context).onPrimaryContainer,
                    ),
                  )
                  .make()
                  .paddingOnly(left: 8),
            row([
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.minus,
                    color: colorScheme(context).onSurface,
                    size: 9,
                  ),
                ),
                cTitleMedium(
                  context,
                  product.qty.toString(),
                  fontFamily: ThemeConf.secondaryFontFamily,
                ).paddingSymmetric(horizontal: 11),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.plus,
                    color: colorScheme(context).onSurface,
                    size: 9,
                  ),
                ),
              ]),
          ])
        ], calign: CrossAxisAlignment.start, align: MainAxisAlignment.spaceBetween),
      ], calign: CrossAxisAlignment.start).p16(),
    ).h(110);
  }
}
