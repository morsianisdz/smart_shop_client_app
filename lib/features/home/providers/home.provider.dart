import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/core/widgets/snackbar.component.dart';
import 'package:smart_shop_client_app/features/offers/models/coupon_off.model.dart';
import 'package:smart_shop_client_app/features/offers/repositories/offer.repository.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = true;
  late List<CouponOfferModel> offers;

  bool get isLoading => _isLoading;

  void initiate() async {
    await getOffers();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getOffers() async {
    try {
      offers = await OfferRepository().getOffers();
    } catch (e) {
      CSnackBar.failed(e.toString());
    }
  }
}
