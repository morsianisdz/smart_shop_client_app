import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/core/services/sqlite.service.dart';
import 'package:smart_shop_client_app/shared/models/cart.model.dart';
import 'package:smart_shop_client_app/shared/models/product.model.dart';

class CartsRepositories {
  Future<List<Cart>> getAllCarts() async {
    List<Cart> carts = [];
    Sqliteservice sqliteservice = GetIt.instance<Sqliteservice>();
    try {
      await sqliteservice.init();
      List<Map> list = await sqliteservice.database!
          .rawQuery('SELECT * FROM carts ORDER BY id DESC');
      for (var cart in list) {
        List<Map> list2 = await sqliteservice.database!
            .rawQuery('SELECT * FROM products WHERE cart_id = ?', [cart['id']]);
        final List<Product> products = Product.fromList(list2);
        carts.add(Cart(
            id: cart['id'],
            name: cart['name'],
            products: products,
            createAt: cart['date']));
      }
      return carts;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> insertCart(Cart cart, String name) async {
    Sqliteservice sqliteservice = GetIt.instance<Sqliteservice>();

    try {
      await sqliteservice.init();
      int cartId = await sqliteservice.database!.rawInsert(
          'INSERT INTO carts(name, date) VALUES(?, ?)',
          [name, DateTime.now().toString()]);
      for (var product in cart.products) {
        await sqliteservice.database!.rawInsert(
            'INSERT INTO products (name, image, cart_id) VALUES(?, ?, ?)',
            [product.name, product.image!.url, cartId]);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteCart(Cart cart) async {
    Sqliteservice sqliteservice = GetIt.instance<Sqliteservice>();
    try {
      await sqliteservice.init();
      var count = await sqliteservice.database!
          .rawDelete('DELETE FROM carts WHERE id = ?', [cart.id]);
      if (count != 0) {
        await sqliteservice.database!
            .rawDelete('DELETE FROM products WHERE cart_id = ?', [cart.id]);
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
