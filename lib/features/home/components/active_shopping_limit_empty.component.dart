import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/core/widgets/icon_container.component.dart';
import 'package:smart_shop_client_app/features/home/providers/home.provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ActiveShoppingLimitEmpty extends StatelessWidget {
  const ActiveShoppingLimitEmpty({Key? key, required this.homeProvider}) : super(key: key);

  final HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: col([
        cTitleSmall(
          context,
          AppText.activeShoppingLimit.tr.toUpperCase(),
          fontFamily: ThemeConf.secondaryFontFamily,
        ).paddingOnly(bottom: 14),

        row([
          IconContainer(
            data: FaIcon(FontAwesomeIcons.wallet),
            backgroundColor: colorScheme(context).secondaryContainer,
          ).paddingOnly(right: 14),
          Expanded(
            child: col([
              cTitleSmall(
                context,
                AppText.noShoppingLimitSet.tr,
                color: colorScheme(context).onSurface,
              ).paddingOnly(bottom: 4),
              cBodyMedium(
                context,
                AppText.tapBelowToStayInControlOfYourBudget.tr,
              ),
            ], calign: CrossAxisAlignment.start),
          ),
        ]).paddingOnly(bottom: 16),
        row([
          CButton.withIcon(
            () {
              homeProvider.onSetLimitPressed(context);
            },
            cTitleSmall(
              context,
              AppText.setALimit.tr,
              color: ColorsConf.textWhite,
              fontWeight: FontWeight.bold,
            ),
            icon: FaIcon(
              FontAwesomeIcons.plus,
              color: ColorsConf.textWhite,
              size: 12,
            ),
          ).w(150).h(45),
        ], align: MainAxisAlignment.end),
      ], calign: CrossAxisAlignment.start).paddingAll(16),
    );
  }
}
