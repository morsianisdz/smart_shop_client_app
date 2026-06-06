import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/features/auth/login/screens/login.screen.dart';
import 'package:smart_shop_client_app/features/home/screens/home.screen.dart';
import 'package:smart_shop_client_app/features/scan/screens/scan.screen.dart';

class NavPagesData {
  static List<Map<String, dynamic>> pages = [
    {
      "index": 0,
      "widget": const Home(),
      "title": AppText.home,
      "icon": FontAwesomeIcons.houseChimney,
    },
    {
      "index": 1,
      "title": AppText.loyalties,
      "widget": const LoginScreen(),
      "icon": FontAwesomeIcons.heart,
    },
    {
      "index": 2,
      "title": AppText.scan,
      "widget": const Scan(),
      "icon": FontAwesomeIcons.barcode,
    },
    {
      "index": 3,
      "title": AppText.offers,
      "widget": const LoginScreen(),
      "icon": FontAwesomeIcons.receipt,
    },
    {
      "index": 4,
      "title": AppText.profile,
      "widget": const LoginScreen(),
      "icon": FontAwesomeIcons.circleUser,
    },
  ];
}
