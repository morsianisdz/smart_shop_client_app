import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.icon, this.isActive = false, this.color});
  final FaIconData icon;
  final bool isActive;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
          radius: 18,
          backgroundColor: colorScheme(context).secondaryContainer, // Dark surface color
          child: FaIcon(
            icon,
            color: color ?? (isActive ? colorScheme(context).primary : colorScheme(context).onPrimaryContainer),
            size: 16,
          ),
        );
  }
}