import 'package:smart_shop_client_app/shared/models/product.model.dart';

class Cart {
  Cart(
      {this.id,
      required this.products,
      this.totalPrice = 0,
      this.name,
      this.createAt,
      this.checked = false});

  int? id;
  String? name;
  List<Product> products;
  double totalPrice;
  String? createAt;
  bool checked;

  factory Cart.fromJson(dynamic json) {
    return Cart(
        name: json["name"],
        products: Product.fromList(json["produts"]),
        totalPrice: json["totalPrice"],
        createAt: json["date"]);
  }

  static List<Cart> fromList(List<dynamic> list) {
    return list.map((item) => Cart.fromJson(item)).toList();
  }
}
