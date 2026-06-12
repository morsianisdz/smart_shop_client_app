import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Coupon {
  final int id;
  final FaIconData icon;
  final String tagText;
  final String title;
  final String subtitle;

  const Coupon({
    required this.id,
    required this.icon,
    required this.tagText,
    required this.title,
    required this.subtitle,
  });

  factory Coupon.fromJson(dynamic json) {
    return Coupon(
      id: json["id"],
      icon: json['icon'],
      tagText: json['tagText'],
      title: json['title'],
      subtitle: json['subtitle']
    );
  }

  static List<Coupon> fromList(List<dynamic> list) {
    return list.map((item) => Coupon.fromJson(item)).toList();
  }
}