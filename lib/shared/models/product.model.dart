import 'package:smart_shop_client_app/core/models/cimage.model.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.image,
    this.oldPrice,
    this.qty = 1,
    this.checked = false,
    this.tag
  });

  final int id;
  final String name;
  final double price;
  final double? oldPrice;
  int qty;
  final CImage? image;
  bool? checked;
  String? tag;

  factory Product.fromJson(dynamic json) {
    return Product(
      id: json["id"],
      name: json['name'],
      price: json['price']?.toDouble(),
      image: CImage(url: json['image'], hash: json['hash']),
      oldPrice: json["oldPrice"].toDouble(),
      qty: json["qty"],
      checked: json["checked"],
      tag: json["tag"]
    );
  }

  static List<Product> fromList(List<dynamic> list) {
    return list.map((item) => Product.fromJson(item)).toList();
  }
}
