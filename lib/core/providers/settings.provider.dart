import 'dart:ui';
import 'package:smart_shop_client_app/core/models/language.model.dart';
import 'package:smart_shop_client_app/core/services/localStorage.service.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SettingsProvider {
  static Locale defaultLanguage = Locale("en");
  LanguageModel? language;

  changeAppLanguage(LanguageModel language) async {
    Get.updateLocale(language.content);
    await GetIt.instance<LocalStorageService>().shpSaveString('language', language.content);
    Get.back();
  }


}