import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Onboarding {
  final String title;
  final String desc;
  final FaIconData icon;
  final Color accentColor;

  Onboarding({required this.title, required this.desc, required this.icon, required this.accentColor});
}