import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/constants/translation.data.dart';
import 'package:smart_shop_client_app/core/services/sqlite.service.dart';
import 'package:smart_shop_client_app/core/providers/settings.provider.dart';
import 'package:smart_shop_client_app/core/services/http.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_client_app/core/providers/Theme.provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_shop_client_app/features/auth/providers/auth.provider.dart';
import 'package:smart_shop_client_app/features/main/providers/main.provider.dart';
import 'package:smart_shop_client_app/features/main/screens/main.screen.dart';
import 'package:smart_shop_client_app/features/notifications/providers/notification.provider.dart';
import 'package:smart_shop_client_app/features/offers/providers/offer.provider.dart';
import 'package:smart_shop_client_app/features/onboarding/providers/onboarding.provider.dart';
import 'package:smart_shop_client_app/features/scan/providers/shopping.provider.dart';
import 'package:smart_shop_client_app/shared/providers/cart.provider.dart';
import 'package:smart_shop_client_app/shared/providers/market.provider.dart';

final getIt = GetIt.instance;

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => MainProvider()),
          ChangeNotifierProvider(create: (_) => ShoppingProvider()),
          ChangeNotifierProvider(create: (_) => OnboardingProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => NotificationProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => OfferProvider())
        ],
        child: GetMaterialApp(
          title: AppText.appTitle,
          debugShowCheckedModeBanner: false,
          translations: LocaleTranslation(),
          locale: SettingsProvider.defaultLanguage,
          theme: GetIt.instance<ThemeProvider>().themeData,
          home: const Main(),
        ),
      ),
    );
  }
}

void setupLocator() {
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerLazySingleton<ThemeProvider>(() => ThemeProvider());
  getIt.registerLazySingleton<Sqliteservice>(() => Sqliteservice());
  getIt.registerLazySingleton<MarketProvider>(() => MarketProvider());
  getIt.registerLazySingleton<MainProvider>(() => MainProvider());
  getIt.registerLazySingleton<AuthProvider>(() => AuthProvider());
  getIt.registerLazySingleton<OnboardingProvider>(() => OnboardingProvider());
}