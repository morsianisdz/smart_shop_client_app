import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/shared/models/user.model.dart';
import 'package:smart_shop_client_app/shared/repositories/auth.repository.dart';

class UserProvier extends ChangeNotifier {
  User? user;
  bool isLoading = false;

  final TextEditingController _phoneNumberController = TextEditingController();
  final bool _passwordVisible = false;

  TextEditingController get usernameController => _phoneNumberController;
  bool get passwordVisible => _passwordVisible;

  void login() async {
    isLoading = true;
    notifyListeners();

    try {
      user = await AuthRepository().otpLogin(_phoneNumberController.text);
    } catch (e) {
      //CSnackBar.failed(e.toString());
    }
  }
}