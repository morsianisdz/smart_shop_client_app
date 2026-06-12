import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/loyalty/models/coupon.model.dart';
import 'package:velocity_x/velocity_x.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: col([
        row([
          FaIcon(coupon.icon, size: 18),
          CTag(text: coupon.tagText, color: colorScheme(context).primary),
        ], align: MainAxisAlignment.spaceBetween).paddingOnly(bottom: 22),
        coupon.title.text
            .textStyle(
              Theme.of(context).textTheme.titleSmall!.copyWith(
                color: colorScheme(context).onSurface,
              ),
            )
            .overflow(TextOverflow.ellipsis)
            .softWrap(false)
            .make()
            .w(double.infinity)
            .paddingOnly(bottom: 2),
        coupon.subtitle.text
            .textStyle(Theme.of(context).textTheme.bodySmall!)
            .overflow(TextOverflow.ellipsis)
            .softWrap(false)
            .make()
            .w(double.infinity)
            .paddingOnly(bottom: 2),
        const Spacer(),
        CButton.withIcon(
          () {},
          cBodyMedium(
            context,
            AppText.clipCoupon.tr,
            color: colorScheme(context).onSurface,
          ),
          icon: FaIcon(
            FontAwesomeIcons.plus,
            color: colorScheme(context).onSurface,
            size: 12,
          ),
          backgroundColor: colorScheme(context).secondaryContainer,
        ).h(36),
      ], calign: CrossAxisAlignment.start).p(16),
    ).w(185).h(185);
  }
}
