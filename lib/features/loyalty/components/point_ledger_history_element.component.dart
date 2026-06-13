import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/loyalty/models/point_ledger_history.model.dart';
import 'package:velocity_x/velocity_x.dart';

class PointLedgerHistoryEelement extends StatelessWidget {
  const PointLedgerHistoryEelement({
    super.key,
    required this.pointLedger,
    required this.isLastEelement,
  });

  final PointLedger pointLedger;
  final bool isLastEelement;

  @override
  Widget build(BuildContext context) {
    return col([
      row([
        col([
          cTitleSmall(
            context,
            pointLedger.title,
            color: colorScheme(context).onSurface,
          ).paddingOnly(bottom: 8),
          cBodyMedium(context, pointLedger.subtitle),
        ], calign: CrossAxisAlignment.start),
        cTitleSmall(
          context,
          AppText.xpts.trArgs([pointLedger.pointsAmount.toString()]),
          color: ColorsConf.green,
        ),
      ], align: MainAxisAlignment.spaceBetween).p16(),
      if (!isLastEelement)
        Divider(
          color: colorScheme(context).onSecondaryContainer,
          thickness: 0.5,
          height: 0,
        ),
    ]);
  }
}
