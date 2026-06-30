import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/offers/providers/offer.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class OffersTag extends StatelessWidget {
  const OffersTag({
    super.key,
    required this.offerProvider,
    required this.index,
  });

  final OfferProvider offerProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cat = offerProvider.categories[index];
    final isSelected = cat == offerProvider.selectedCategory;
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected
            ? colorScheme(context).primary
            : colorScheme(context).secondaryContainer,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: cBodyMedium(
          context,
          cat,
          color: isSelected
              ? ColorsConf.textWhite
              : colorScheme(context).onPrimaryContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).onInkTap(() => offerProvider.onCatTap(cat));
  }
}
