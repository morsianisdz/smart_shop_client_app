import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/features/offers/models/coupon_off.model.dart';

class OfferProvider extends ChangeNotifier {
  List<CouponOfferModel> offers = FakeData.offers;
  String selectedCategory = "All Offers";
  final List<String> categories = ["All Offers", "Dairy", "Bakery", "Produce"];

  void onCatTap(String cat) {}
}
