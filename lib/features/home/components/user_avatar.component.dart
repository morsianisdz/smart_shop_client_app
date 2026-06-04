import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/providers/Theme.provider.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: UiConf.userAvatarRadius,
      backgroundColor: GetIt.instance<ThemeProvider>().isThemeDark() ? Color(0xFF1E293B) : Color.fromARGB(255, 234, 235, 236),
      child: Icon(Icons.person, color: colorScheme(context).onPrimaryContainer),
    );
  }
}