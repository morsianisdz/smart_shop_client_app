// ignore_for_file: dead_code

import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/constants/apis.data.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/core/services/http.service.dart';
import 'package:smart_shop_client_app/shared/models/user.model.dart';

class AuthRepository {
  Future<User> otpLogin(String phoneNumber) async {
    return FakeData.user;
  }

  Future<User> register(
    String email,
    String password,
    String confirmPassword,
  ) async {
    return FakeData.user;
    try {
      var response = await GetIt.instance<HttpService>().post(
        ApisData.addUser,
        {
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        },
      );
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> login(
    String email, String password
  ) async {
    return FakeData.user;
    try {
      var response = await GetIt.instance<HttpService>().post(ApisData.userLogin, {
        "email": email, "password": password
      });

      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUserData() async {
    try {
      return FakeData.user;
      var response = GetIt.instance<HttpService>().get(ApisData.getUserData);
      return User.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
