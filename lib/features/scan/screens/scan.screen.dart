import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/features/scan/components/scan_header.component.dart';
import 'package:smart_shop_client_app/features/scan/components/scanner_frame.component.dart';
import 'package:smart_shop_client_app/features/scan/providers/shopping.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return [
        /* MobileScanner(
          onDetect: (result) {
            print(result.barcodes.first.rawValue);
          },
        ), */
        CustomPaint(
          painter: ScannerFramePainter(),
          child: col([
            const FaIcon(
              FontAwesomeIcons.barcode,
              size: 60,
              color: Colors.white70,
            ).paddingOnly(bottom: 16),
            cTitleSmall(context, AppText.alignBarcode.tr.toUpperCase()),
          ], align: MainAxisAlignment.center).centered(),
        ).w(300).h(300).centered(),
        ScanHeader(),
        CButton.textOnly(() => ShoppingProvider().onDetectBarcode(context), cTitleMedium(context, "scan simulation", color: colorScheme(context).onSurface)).w(200).centered()
      ].stack();
  }
}
