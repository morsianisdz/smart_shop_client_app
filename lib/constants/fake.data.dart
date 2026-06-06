import 'package:smart_shop_client_app/core/models/cimage.model.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';

class FakeData {
  
  static List<Product> products = [
    Product(
      id: 1,
      name: "Sila Olive oil 500ml",
      price: 250,
      tag: "10% off",
      image: CImage(
        url:
            "https://static.vecteezy.com/system/resources/thumbnails/059/028/147/small_2x/olive-oil-bottle-product-liquid-food-cooking-ingredient-isolated-on-transparent-background-png.png",
        hash: "4965sdf484s6df49",
      ),
    ),
    Product(
      id: 1,
      name: "Special Milk 1L",
      price: 130,
      oldPrice: 200,
      tag: "BOGO",
      image: CImage(
        url:
            "https://static.vecteezy.com/system/resources/previews/035/410/276/non_2x/groceries-theme-3d-milk-product-almond-milk-bottle-on-a-transparent-background-3d-rendering-free-png.png",
        hash: "4965sdf484s6df49",
      ),
    ),
  ];
}