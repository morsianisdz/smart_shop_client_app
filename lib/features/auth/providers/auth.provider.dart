import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/constants/local_storage_keys.dart';
import 'package:smart_shop_client_app/core/services/localStorage.service.dart';
import 'package:smart_shop_client_app/core/widgets/snackbar.component.dart';
import 'package:smart_shop_client_app/features/main/screens/main.screen.dart';
import 'package:smart_shop_client_app/shared/models/user.model.dart';
import 'package:smart_shop_client_app/features/auth/repositories/auth.repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_shop_client_app/shared/providers/user.provider.dart';

class AuthProvider extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailTextController => _emailTextController;
  TextEditingController get passwordTextController => _passwordTextController;
  TextEditingController get confirmPasswordTextController =>
      _confirmPasswordTextController;

  String password = "";

  final GlobalKey<FormState> _registerformKey = GlobalKey<FormState>();
  GlobalKey<FormState> get registerformKey => _registerformKey;

  final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();
  GlobalKey<FormState> get loginformKey => _loginformKey;

  String? clientId;
  String? serverClientId;

  void initiate() {
    _usernameController.text = "";
    _emailTextController.text = "";
    _passwordTextController.text = "";
    _confirmPasswordTextController.text = "";
  }

  Future<void> register() async {
    _isLoading = true;
    notifyListeners();
    try {
      if (_registerformKey.currentState!.validate()) {
        await AuthRepository().register(
          _usernameController.text,
          _emailTextController.text,
          _passwordTextController.text,
        );
        CSnackBar.success(AppText.registrationSuccess.tr);
        Get.back();
      }
    } catch (e) {
      CSnackBar.failed(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  void login() async {
    _emailTextController.text = "test4@test.com";
    _passwordTextController.text = "Pass@123";
    _isLoading = true;
    notifyListeners();
    try {
      if (_loginformKey.currentState!.validate()) {
        User backendUser = await AuthRepository().login(
          _emailTextController.text,
          _passwordTextController.text,
        );
      
        await LocalStorageService().shpSaveString(LS.jwt, backendUser.token);

        GetIt.instance<UserProvider>().user = backendUser;

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

  Future<bool> isLogedIn() async {
    if (await LocalStorageService().checkKey(LS.jwt)) {
      try {
        GetIt.instance<UserProvider>().user = await AuthRepository().getUserData();

        return true;
      } catch (e) {
        CSnackBar.failed(e.toString());
        return false;
      }
    } else {
      return false;
    }
  }
}
