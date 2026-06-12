import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/shared/models/user.model.dart';

class AuthRepository {
  Future<User> otpLogin(String phoneNumber) async {
    return FakeData.user;
  }

  void saveUser(User user) {}

}