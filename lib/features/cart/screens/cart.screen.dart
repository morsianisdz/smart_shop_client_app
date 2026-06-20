import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/features/home/components/active_shopping_limit.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/shared/components/screen_header.component.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: col([
        ScreenHeader(
          title: AppText.myDigitalCart.tr,
          leading: CTag(
            text: AppText.xItem.trArgs(["4"]).toUpperCase(),
            color: colorScheme(context).onPrimaryContainer,
          ),
        ).paddingOnly(bottom: 24),
        ActiveShoppingLimit().paddingOnly(bottom: 18),
      ]).paddingSymmetric(horizontal: 16),
    );
  }
}
