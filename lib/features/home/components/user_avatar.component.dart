import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/image_builder.helper.dart';
import 'package:smart_shop_client_app/features/auth/providers/auth.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.radius
  });

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? UiConf.userAvatarRadius,
      backgroundColor: colorScheme(context).secondaryContainer,
      child: GetIt.instance<AuthProvider>().user != null
          ? ImageBuilderHelper.coverUrl(
              GetIt.instance<AuthProvider>().user!.image.url,
            ).clipOval()
          : Icon(Icons.person, color: colorScheme(context).onPrimaryContainer),
    );
  }
}
