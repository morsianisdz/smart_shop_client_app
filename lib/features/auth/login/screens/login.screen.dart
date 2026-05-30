import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/appText.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/core/widgets/input_field.components.dart';
import 'package:smart_shop_client_app/features/auth/login/components/auth_devider.component.dart';
import 'package:smart_shop_client_app/features/auth/login/components/logo_widget.component.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color iconsColor = colorScheme(context).onPrimaryContainer;

    return BaseView(
      backgroundColor: colorScheme(context).surface,
      extended: true,
      transparent: true,
      body:
          [
                LogoWidget().centered().paddingSymmetric(vertical: 48),
                titleSmall(
                  context,
                  AppText.email.tr.toUpperCase(),
                  fontFamily: ThemeConf.secondaryFontFamily,
                ).paddingOnly(bottom: 8),
                CInputField(
                  icon: Icon(Icons.email, color: iconsColor),
                ).paddingOnly(bottom: 20),
                [
                      titleSmall(
                        context,
                        AppText.password.tr.toUpperCase(),
                        fontFamily: ThemeConf.secondaryFontFamily,
                      ),
                      titleSmall(
                        context,
                        AppText.forgot.tr,
                        fontFamily: ThemeConf.secondaryFontFamily,
                        color: colorScheme(context).primary,
                        fontWeight: FontWeight.bold,
                      ).onTap(() {}),
                    ]
                    .row(alignment: MainAxisAlignment.spaceBetween)
                    .paddingOnly(bottom: 8),
                CInputField(
                  icon: Icon(Icons.lock, color: iconsColor),
                  obscureText: true,
                ).paddingOnly(bottom: 32),
                CButton.textOnly(
                  () {},
                  titleMedium(
                    context,
                    AppText.login.tr.toUpperCase(),
                    color: ColorsConf.textWhite,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                AuthDevider().paddingOnly(bottom: 28),
                [
                  CButton.withIcon(
                    () {},
                    titleMedium(
                      context,
                      AppText.google.tr,
                      color: colorScheme(context).onSurface,
                    ),
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    backgroundColor: colorScheme(context).primaryContainer,
                  ).flexible(),
                  const SizedBox(width: 18),
                  CButton.withIcon(
                    () {},
                    titleMedium(
                      context,
                      AppText.google.tr,
                      color: colorScheme(context).onSurface,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      color: colorScheme(context).onSurface,
                    ),
                    backgroundColor: colorScheme(context).primaryContainer,
                  ).flexible(),
                ].row().paddingOnly(bottom: 28),
                [
                      titleSmall(
                        context,
                        AppText.news.tr,
                      ).paddingOnly(right: 4),
                      titleSmall(
                        context,
                        AppText.createAccount.tr,
                        color: colorScheme(context).primary,
                      ).onTap(() {}),
                    ]
                    .row(alignment: MainAxisAlignment.center)
                    .paddingOnly(bottom: 48),
              ]
              .column(crossAlignment: CrossAxisAlignment.start)
              .paddingSymmetric(horizontal: 24),
    );
  }
}
