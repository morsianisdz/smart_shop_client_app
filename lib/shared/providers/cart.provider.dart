import 'package:flutter/foundation.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/shared/models/cart.model.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';

class CartProvider extends ChangeNotifier {
  bool isLoading = true;
  Cart cart = Cart(products: FakeData.products);
  double totalPrice = 0;
  void add(Product product) {
    int index = _getProductIndex(product.id);
    if (index < 0) {
      cart.products.add(product);
    } else {
      cart.products[index].qty++;
    }
    totalPrice += product.price;
    notifyListeners();
  }

  void remove(Product product) {
    int index = _getProductIndex(product.id);
    cart.products[index].qty--;
    if (cart.products[index].qty <= 0) {
      cart.products.remove(cart.products[index]);
    }
    cart.totalPrice -= product.price;
    notifyListeners();
  }

  int _getProductIndex(int id) {
    return cart.products.indexWhere((productToFind) => productToFind.id == id);
  }

  /* Future<List<Cart>> getCarts() async {
    try {
      cart = await CartsRepositories().getAllCarts();
    } catch (e) {
      CSnackBar.failed(e.toString());
    }
    return carts;
  } */

  /* void unsaveCart(Cart cart) async {
    try {
      if (await CartsRepositories().deleteCart(cart)) {
        carts.remove(cart);
        notifyListeners();
      }
    } catch (e) {
      CSnackBar.failed(e.toString());
    }
  } */

  void onCheckChange(bool? value, int index) {
    cart.products[index].checked = value;
    notifyListeners();
  }
}
