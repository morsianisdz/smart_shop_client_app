import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/features/home/components/custom_tag.component.dart';
import 'package:smart_shop_client_app/features/home/components/user_avatar.component.dart';
import 'package:smart_shop_client_app/shared/providers/user.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    GetIt.instance<UserProvier>().user = FakeData.user;
    return BaseView(
      body: col([
        row([
          cTitleMedium(
            context,
            AppText.accountSettings.tr,
            color: colorScheme(context).onSurface,
          ),
          FaIcon(
            FontAwesomeIcons.gear,
            size: 16,
            color: colorScheme(context).onPrimaryContainer,
          ),
        ], align: MainAxisAlignment.spaceBetween).paddingOnly(
          top: 48,
          bottom: 16,
        ),
        Card(
          child: row([
            UserAvatar(radius: 28).paddingOnly(right: 16),
            col([
              cTitleSmall(
                context,
                GetIt.instance<UserProvier>().user!.username,
                color: colorScheme(context).onSurface,
              ).paddingOnly(bottom: 4),
              cBodyMedium(
                context,
                GetIt.instance<UserProvier>().user!.email,
              ).paddingOnly(bottom: 8),
              CTag(text: AppText.bronzeTier.tr.toUpperCase(), color: colorScheme(context).secondary)
            ], calign: CrossAxisAlignment.start),
          ]).p(16),
        ).paddingOnly(bottom: 24),
        cTitleSmall(context, AppText.shoppingControls.tr.toUpperCase(), fontFamily: ThemeConf.secondaryFontFamily)
      ], calign: CrossAxisAlignment.start).paddingSymmetric(horizontal: 16),
    );
  }
}
