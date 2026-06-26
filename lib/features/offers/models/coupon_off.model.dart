import 'package:smart_shop_client_app/shared/models/product.model.dart';

class CouponOfferModel {
  final int id;
  final String title;
  final String description;
  final String discountTag;
  final String expirationText;
  final Product product;
  bool isClipped;

  CouponOfferModel({
    required this.id,
    required this.title,
    required this.description,
    required this.discountTag,
    required this.product,
    required this.expirationText,
    this.isClipped = false,
  });

  factory CouponOfferModel.fromJson(dynamic json) {
    return CouponOfferModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      discountTag: json['discountTag'],
      product: json['product'],
      expirationText: json['expirationText'],
    );
  }

  static List<CouponOfferModel> fromList(List<dynamic> list) {
    return list.map((item) => CouponOfferModel.fromJson(item)).toList();
  }
}
