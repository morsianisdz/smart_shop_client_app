import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/image_builder.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/shared/helpers/price_builder.helper.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: [
        col([
          ImageBuilderHelper.coverUrl(
            product.image!.url,
            width: 50,
            height: 50,
          ).paddingSymmetric(vertical: 8),
          product.name.text
              .textStyle(
                Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: colorScheme(context).onSurface,
                ),
              ).overflow(TextOverflow.ellipsis)
              .softWrap(false)
              .make()
              .w(double.infinity)
              .paddingOnly(bottom: 4),
          row([
            cTitleSmall(
              context,
              priceBuilder(product.price.toString()),
              color: colorScheme(context).primary,
            ),
            if (product.oldPrice != null) ...[
              priceBuilder(product.oldPrice.toString()).text
                  .textStyle(
                    TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: colorScheme(context).onPrimaryContainer,
                    ),
                  )
                  .make()
                  .paddingOnly(left: 8),
            ],
          ]),
        ]).paddingOnly(top: 8),
        if (product.tag != null)
          CTag(
            text: product.tag!,
            color: colorScheme(context).primary,
          ).positioned(right: -6, top: -6),
      ].stack(clip: Clip.none).p(16),
    );
  }
}
