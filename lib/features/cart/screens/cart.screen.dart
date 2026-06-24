import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/features/cart/components/cart_item.component.dart';
import 'package:smart_shop_client_app/features/home/components/active_shopping_limit.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/shared/components/screen_header.component.dart';
import 'package:smart_shop_client_app/shared/providers/cart.provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = context.read<CartProvider>();
    return BaseView(
      body: col([
        ScreenHeader(
          title: AppText.myDigitalCart.tr,
          withBack: true,
          leading: CTag(
            text: AppText.xItem.trArgs(["4"]).toUpperCase(),
            color: colorScheme(context).onPrimaryContainer,
          ),
        ).paddingOnly(bottom: 24),
        ActiveShoppingLimit().paddingOnly(bottom: 18),
        ListView.builder(
          shrinkWrap: true,
          itemCount: cartProvider.cart.products.length,
          itemBuilder: (context, index) {
            return CartItem(
              product: cartProvider.cart.products[index],
              cartProvider: cartProvider,
            ).paddingOnly(bottom: 8);
          },
        ),
      ]).paddingSymmetric(horizontal: 16),
    );
  }
}
