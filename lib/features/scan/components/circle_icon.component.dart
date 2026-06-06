import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/providers/Theme.provider.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.icon, required this.isActive});
  final FaIconData icon;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
          radius: 24,
          backgroundColor: GetIt.instance<ThemeProvider>().isThemeDark() ? Color(0xFF1E293B) : Color.fromARGB(255, 234, 235, 236), // Dark surface color
          child: FaIcon(
            icon,
            color: isActive ? colorScheme(context).primary : colorScheme(context).onPrimaryContainer,
            size: 20,
          ),
        );
  }
}