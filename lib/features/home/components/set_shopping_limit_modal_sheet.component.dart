import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/input_field.components.dart';
import 'package:smart_shop_client_app/features/scan/components/drag_handle.component.dart';

class SetShoppingLimitModalSheet extends StatelessWidget {
  const SetShoppingLimitModalSheet({super.key});

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
            controller: TextEditingController(),
            prefixIcon: FaIcon(FontAwesomeIcons.dollarSign, size: 14),
            text: AppText.egx.trArgs(["75"]),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ).paddingOnly(bottom: 24),

          row([
            Expanded(
              child: OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  /* final double? parsedLimit = double.tryParse(limitController.text);
                    if (parsedLimit != null && parsedLimit > 0) {
                      homeProvider.updateShoppingLimit(parsedLimit);
                      Get.back();
                    } else {
                      Get.snackbar('Error', 'Please enter a valid amount', snackPosition: SnackPosition.BOTTOM);
                    } */
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6600),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
        ],
        size: MainAxisSize.min,
        calign: CrossAxisAlignment.start,
      ),
    );
  }
}
