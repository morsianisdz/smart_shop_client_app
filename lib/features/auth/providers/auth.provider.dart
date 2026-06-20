import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/constants/local_storage_keys.dart';
import 'package:smart_shop_client_app/core/services/localStorage.service.dart';
import 'package:smart_shop_client_app/core/widgets/snackbar.component.dart';
import 'package:smart_shop_client_app/features/main/screens/main.screen.dart';
import 'package:smart_shop_client_app/shared/models/user.model.dart';
import 'package:smart_shop_client_app/features/auth/repositories/auth.repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  User? user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get confirmPasswordTextController =>
      _confirmPasswordTextController;

  String password = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  String? clientId;
  String? serverClientId;

  Future<void> register() async {
    _isLoading = true;
    notifyListeners();
    try {
      if (_formKey.currentState!.validate()) {
        await AuthRepository().register(
          _emailTextController.text,
          _passwordTextController.text,
          _confirmPasswordTextController.text,
        );

        Get.back();
      }
    } catch (e) {
      CSnackBar.failed(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  void login() async {
    _isLoading = true;
    notifyListeners();
    try {
      if (_formKey.currentState!.validate()) {
        User backendUser = await AuthRepository().login(
          _emailTextController.text,
          _passwordTextController.text,
        );

        await LocalStorageService().secureSave(LS.jwt, backendUser.token);

        user = backendUser;

        Get.off(() => const Main());
      }
    } catch (e) {
      CSnackBar.failed(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> googleSignIn() async {
    try {
      await GoogleSignIn.instance.initialize();

      final GoogleSignInAccount user = await GoogleSignIn.instance
          .authenticate();

      print(user.email);
    } catch (e) {
      print(e);
    }
  }

  void onPasswordFieldChanged(String value) {
    password = value;
    notifyListeners();
  }

    Future<bool> isLogedIn() async =>
      await LocalStorageService().secureCheckKey(LS.jwt);
}
