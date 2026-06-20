import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/constants/local_storage_keys.dart';
import 'package:smart_shop_client_app/constants/onboarding.data.dart';
import 'package:smart_shop_client_app/core/services/localStorage.service.dart';
import 'package:smart_shop_client_app/features/main/screens/main.screen.dart';
import 'package:smart_shop_client_app/features/onboarding/models/on_boarding.model.dart';

class OnboardingProvider extends ChangeNotifier {

  final List<Onboarding> _onboardingSteps = OnboardingData.onboardingSteps;

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<Onboarding> get onboardingSteps => _onboardingSteps;
  PageController get pageController => _pageController;
  int get currentIndex => _currentIndex;

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void handleNext() {
    if (_currentIndex < _onboardingSteps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    } else {
      LocalStorageService().shpSaveBool(LS.firstTime, true);
      Get.to(()=>Main());
    }
  }
}