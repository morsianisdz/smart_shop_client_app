import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/image_builder.helper.dart';
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
        [
          ImageBuilderHelper.coverUrl(
            product.image!.url!,
            width: 50,
            height: 50,
          ).paddingSymmetric(vertical: 8),
          cTitleSmall(
            context,
            product.name,
            color: colorScheme(context).onSurface,
          ).paddingOnly(bottom: 4),
          [
            cTitleSmall(
              context,
              priceBuilder(product.price.toString()),
              color: colorScheme(context).primary,
            ),
            if (product.oldPrice != null) ...[
              const SizedBox(width: 8),
              cBodyMedium(
                context,
                priceBuilder(product.oldPrice.toString()),
                color: colorScheme(context).primary,
              ),
              product.oldPrice
                  .toString()
                  .text
                  .textStyle(
                    TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: colorScheme(context).onPrimaryContainer,
                    ),
                  )
                  .make(),
            ],
          ].row(),
        ].column(),
        if (product.tag != null)
        CTag(text: product.tag!, color: colorScheme(context).primary).positioned(right: 0)
      ].stack().p(16),
    );
  }
}
