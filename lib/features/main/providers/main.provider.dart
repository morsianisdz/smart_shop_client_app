import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/nav_pages.data.dart';
import 'package:smart_shop_client_app/features/main/models/page.model.dart';

class MainProvider extends ChangeNotifier {
  int _currentIndex = NavPagesData.defaultScreen;

  final List<AppPage> _pages = AppPage.fromList(NavPagesData.pages);

  int get currentIndex => _currentIndex;
  List<AppPage> get pages => _pages;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
