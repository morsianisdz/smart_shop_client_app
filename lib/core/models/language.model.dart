import 'package:flutter/material.dart';

class LanguageModel {
  LanguageModel(
      {required this.icon, required this.name, required this.content});

  final String icon;
  final String name;
  final Locale content;

  factory LanguageModel.fromJson(dynamic json) {
    return LanguageModel(
        icon: json["icon"], name: json['name'], content: json['content']);
  }

  static List<LanguageModel> fromList(List<dynamic> list) {
    return list.map((item) => LanguageModel.fromJson(item)).toList();
  }
}
