import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
    required this.cartProvider,
    required this.product,
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
        ).paddingSymmetric(vertical: 8),
        const SizedBox(width: 16.0),

        col(
          [
            cTitleSmall(context, product.name).paddingOnly(bottom: 6),
            if (product.tag != null)
              cBodyMedium(
                context,
                product.tag!,
                color: colorScheme(context).primary,
                fontWeight: FontWeight.bold,
              ),

            const SizedBox(height: 14.0),
            row([
              cTitleSmall(context, AppText.unitx.trArgs([priceBuilder(product.price)])),
              if (product.oldPrice != null)
              priceBuilder(product.oldPrice!).text
                  .textStyle(
                    TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: colorScheme(context).onPrimaryContainer,
                    ),
                  )
                  .make()
            ]).paddingOnly(top: 14),
          ],
          calign: CrossAxisAlignment.start,
          size: MainAxisSize.min,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cTitleMedium(context, priceBuilder(product.price)),paddingOnly(bottom: 24),
            /* Row(
              children: [
                // Minus Button
                _buildQuantityButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {},
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Plus Button
                _buildQuantityButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () {},
                ),
              ],
            ), */
          ],
        ),
      ], calign: CrossAxisAlignment.center).p16(),
    );
  }

  // Extracted custom rounded square button helper method
  Widget _buildQuantityButton({
    required FaIconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 32,
      height: 32,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(const Color(0xFF222B3E)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        icon: FaIcon(icon, color: Colors.white, size: 10),
      ),
    );
  }
}
