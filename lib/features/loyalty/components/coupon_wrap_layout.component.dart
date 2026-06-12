import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/features/loyalty/components/coupon_card.component.dart';
import 'package:smart_shop_client_app/features/loyalty/models/coupon.model.dart';
import 'package:velocity_x/velocity_x.dart';

class CouponWrapLayout extends StatelessWidget {
  const CouponWrapLayout({super.key, required this.coupons, this.spacing = 8});

  final List<Coupon> coupons;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;
        final cardWidth = (parentWidth - spacing) / 2;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
              children: coupons.map((coupon) => CouponCard(coupon: coupon).w(cardWidth)).toList());
      },
    );
  }
}