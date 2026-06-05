import 'package:smart_shop_client_app/core/models/cimage.model.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';

class FakeData {
  
  static List<Product> products = [
    Product(
      id: 1,
      name: "Sila Haricots 500gr",
      price: 250,
      tag: "10% off",
      image: CImage(
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9Yg8_PiAtYmZNcOyz_O1bxhYBc0xCpFlPZg&s",
        hash: "4965sdf484s6df49",
      ),
    ),
    Product(
      id: 1,
      name: "Special Melogramo 1L",
      price: 130,
      oldPrice: 200,
      tag: "BOGO",
      image: CImage(
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1hIafYDduwz2hN5QJ48lUPZoFzaPTDtcZ_A&s",
        hash: "4965sdf484s6df49",
      ),
    ),
  ];
}