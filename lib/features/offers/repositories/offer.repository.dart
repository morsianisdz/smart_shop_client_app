import 'package:smart_shop_client_app/constants/apis.data.dart';
import 'package:smart_shop_client_app/core/services/http.service.dart';
import 'package:smart_shop_client_app/features/offers/models/coupon_off.model.dart';

class OfferRepository {

  Future<List<CouponOfferModel>> getOffers() async {
    try {
      
      var response = await HttpService().get(ApisData.getCouponOffers);
      return CouponOfferModel.fromList(response);
    } catch (e) {
      rethrow;
    }
  }
}