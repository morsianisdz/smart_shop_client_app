import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/image_builder.helper.dart';
import 'package:smart_shop_client_app/shared/providers/user.provider.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.radius});

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? UiConf.userAvatarRadius,
      backgroundColor: colorScheme(context).secondaryContainer,
      child: GetIt.instance<UserProvier>().user != null
          ? ImageBuilderHelper.coverUrl(
              GetIt.instance<UserProvier>().user!.image.url,
            )
          : Icon(Icons.person, color: colorScheme(context).onPrimaryContainer),
    );
  }
}
