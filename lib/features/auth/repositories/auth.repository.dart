// ignore_for_file: dead_code

import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/constants/apis.data.dart';
import 'package:smart_shop_client_app/core/services/http.service.dart';
import 'package:smart_shop_client_app/shared/models/user.model.dart';

class AuthRepository {

  Future<void> register(String username, String email, String password) async {
    try {
      await GetIt.instance<HttpService>().post(
        withbearer: false,
        ApisData.saveUser,
        {"username": username, "email": email, "password": password},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<User> login(String email, String password) async {
    try {
      var response = await GetIt.instance<HttpService>().post(
        ApisData.userLogin,
        {"email": email, "password": password},
        withbearer: false
      );

      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUserData() async {
    try {
      //return FakeData.user;
      var response = await GetIt.instance<HttpService>().get(
        ApisData.getUserData,
      );

      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
