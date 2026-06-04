import 'package:smart_shop_client_app/core/models/cimage.model.dart';
import 'package:smart_shop_client_app/core/models/cposition.model.dart';
import 'package:smart_shop_client_app/shared/models/web_page.model.dart';

class Market {
  Market(
      {required this.name,
      required this.adress,
      this.openTime,
      required this.currency,
      required this.profileImage,
      required this.coverImage,
      this.description,
      this.position,
      this.webPage,});

  final String name;
  final String adress;
  final String? openTime;
  final String currency;
  final CImage profileImage;
  final CImage coverImage;
  final String? description;
  final CPosition? position;
  final WebPage? webPage;

  factory Market.fromJson(dynamic json) {
    return Market(
        name: json['name'],
        adress: json['adress'],
        openTime: json['openTime'],
        currency: json['currency'],
        profileImage: CImage(url: json['profileImage'], hash: json['hash']),
        coverImage: CImage(url: json['coverImage'], hash: json['hash']),
        description: json['description'],
        position: CPosition(latitude: json['latitude'], longitude: json['longitude']),
        webPage: WebPage(domaineName: json['domaineName'], url: json['url'])
        );
  }
}
