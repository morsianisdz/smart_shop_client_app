import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/features/loyalty/models/reward.model.dart';
import 'package:smart_shop_client_app/shared/helpers/price_builder.helper.dart';
import 'package:velocity_x/velocity_x.dart';

class RewardCard extends StatelessWidget {
  final Reward reward;

  const RewardCard({
    super.key,
    required this.reward,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: col([
        cTitleLarge(
          context,
          AppText.xOff.trArgs([priceBuilder(reward.discount)]),
          color: colorScheme(context).primary,
        ).paddingOnly(bottom: 5),
        cBodyMedium(context, reward.description),

        const Spacer(),
        CButton.textOnly(
          () {},
          cTitleSmall(
            context,
            AppText.xpts.trArgs([reward.points.toString()]),
            color: colorScheme(context).onSurface,
            fontWeight: FontWeight.bold,
          ),
        ).h(36),
      ], calign: CrossAxisAlignment.start).p(16),
    ).w(170);
  }
}
