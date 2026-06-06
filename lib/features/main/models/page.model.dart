import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppPage {
  AppPage({
    required this.index,
    required this.widget,
    required this.title,
    required this.icon,
  });

  final int index;
  final Widget widget;
  final String title;
  final FaIconData icon;

  factory AppPage.fromJson(dynamic json) {
    return AppPage(
      index: json['index'],
      widget: json["widget"],
      title: json['title'],
      icon: json['icon'],
    );
  }

  static List<AppPage> fromList(List<dynamic> list) {
    return list.map((item) => AppPage.fromJson(item)).toList();
  }
}
