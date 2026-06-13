import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/utils.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/onboarding/models/on_boarding.model.dart';
import 'package:velocity_x/velocity_x.dart';

class PageItem extends StatelessWidget {
  const PageItem({super.key, required this.step});

  final Onboarding step;

  @override
  Widget build(BuildContext context) {
    return col([
      Container(
        width: 144,
        height: 144,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: step.accentColor.withValues(alpha: 0.12),
          border: Border.all(color: step.accentColor.withValues(alpha: 0.2)),
        ),
        child: FaIcon(step.icon, size: 48, color: step.accentColor).centered(),
      ).centered().paddingOnly(bottom: 32),
      cTitleLarge(context, step.title).paddingOnly(bottom: 12),
      cBodyMedium(context, step.desc, textAlign: TextAlign.center).px32()
      //step.desc.text.gray400.size(12).center.make().px32(),
    ], size: MainAxisSize.min).centered();
  }
}