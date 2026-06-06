import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/features/scan/components/scan_header.component.dart';
import 'package:velocity_x/velocity_x.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: [
        ScanHeader().paddingOnly(top: 48)
      ].column(),
    );
  }
}
