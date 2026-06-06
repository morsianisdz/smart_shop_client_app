import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/features/scan/components/scanned_product_bottom_modal_sheet.component.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';

class ShoppingProvider extends ChangeNotifier {
  Future<void> _showScanedProductPopup(BuildContext context, Product product) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          Colors.transparent, // Required for custom rounded corners
      builder: (context) {
        return ScannedProductBottomModalSheet(product: product);
      },
    );
  }

  void onDetectBarcode(BuildContext context) async {
    final Product product = FakeData.products[1]; 
    await _showScanedProductPopup(context, product);
  }
}
