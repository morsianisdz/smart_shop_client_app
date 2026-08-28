import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/input_field.components.dart';
import 'package:smart_shop_client_app/features/home/providers/home.provider.dart';
import 'package:smart_shop_client_app/features/scan/components/drag_handle.component.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:velocity_x/velocity_x.dart';

class SetShoppingLimitModalSheet extends StatelessWidget {
  const SetShoppingLimitModalSheet({super.key, required this.homeProvider});

  final HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: BoxDecoration(
        color: colorScheme(context).primaryContainer, // Dark background color
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: col(
        [
          DragHandle().paddingOnly(bottom: 24),
          cTitleMedium(
            context,
            AppText.setShoppingLimit.tr,
            fontWeight: FontWeight.bold,
          ).paddingOnly(bottom: 6),
          cTitleSmall(
            context,
            AppText.enterYourMaximumBudgetForThisShoppingTrip.tr,
          ).paddingOnly(bottom: 20),
          CInputField(
            controller: homeProvider.limitFieldController,
            prefixIcon: FaIcon(FontAwesomeIcons.dollarSign, size: 14),
            text: AppText.egx.trArgs(["75"]),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            fillColor: colorScheme(context).onPrimary,
          ).paddingOnly(bottom: 24),

          row([
            CButton.textOnly(
              Get.back,
              cTitleSmall(
                context,
                AppText.cancel.tr.toUpperCase(),
                color: colorScheme(context).onSurface,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: colorScheme(
                context,
              ).onSurface.withValues(alpha: 0.1),
            ).paddingOnly(right: 16).expand(),
            CButton.textOnly(
              homeProvider.setLimit,
              cTitleSmall(
                context,
                AppText.setALimit.tr.toUpperCase(),
                color: colorScheme(context).onSurface,
                fontWeight: FontWeight.bold,
              ),
            ).expand(),
          ]),
        ],
        size: MainAxisSize.min,
        calign: CrossAxisAlignment.start,
      ),
    );
  }
}
