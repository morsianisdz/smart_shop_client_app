import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/config/nav_pages.data.dart';
import 'package:smart_shop_client_app/constants/local_storage_keys.dart';
import 'package:smart_shop_client_app/core/services/localStorage.service.dart';
import 'package:smart_shop_client_app/core/widgets/snackbar.component.dart';
import 'package:smart_shop_client_app/features/auth/providers/auth.provider.dart';
import 'package:smart_shop_client_app/features/auth/repositories/auth.repository.dart';
import 'package:smart_shop_client_app/features/auth/screens/login.screen.dart';
import 'package:smart_shop_client_app/features/main/models/page.model.dart';
import 'package:smart_shop_client_app/features/onboarding/screens/onboarding.screen.dart';

class MainProvider extends ChangeNotifier {
  int _currentIndex = NavPagesData.defaultScreen;

  final List<AppPage> _pages = AppPage.fromList(NavPagesData.pages);

  int get currentIndex => _currentIndex;
  List<AppPage> get pages => _pages;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void initiate() async {
    //await LocalStorageService().secureDelete(LS.jwt);
    if (!(await LocalStorageService().checkKey(LS.firstTime))) {
      await Get.off(() => OnboardingScreen());
    }
    if (await GetIt.instance<AuthProvider>().isLogedIn() == false) {
      await Get.off(() => LoginScreen());
    }

    try {
      GetIt.instance<AuthProvider>().user = await AuthRepository().getUserData();
    } catch (e) {
      CSnackBar.failed(e.toString());
      Get.off(() => LoginScreen());
    }

    _isLoading = false;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void sweapScreen(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
