import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/constants/appText.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:velocity_x/velocity_x.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return [
    Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: colorScheme(context).primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(48),
        border: Border.all(color: colorScheme(context).primary.withValues(alpha: 0.2)),
      ),
      child: Icon(Icons.shopping_cart, size: 40),
    ).paddingOnly(bottom: 16),
    Text.rich(
      TextSpan(
        children: [
          AppText.appNamePart1.tr.textSpan
              .textStyle(Theme.of(context).textTheme.titleLarge!)
              .make(),
          AppText.appNamePart2.tr.textSpan
              .textStyle(
                Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              )
              .make(),
        ],
      ),
    ),
    titleSmall(
      context,
      AppText.yourInStoreShoppingHelper.tr,
      fontWeight: FontWeight.w400,
    ),
  ].column();
  }
}