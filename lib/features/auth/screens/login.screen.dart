import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/state_managmenet.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/core/widgets/input_field.components.dart';
import 'package:smart_shop_client_app/features/auth/components/auth_devider.component.dart';
import 'package:smart_shop_client_app/features/auth/components/logo_widget.component.dart';
import 'package:smart_shop_client_app/features/auth/providers/auth.provider.dart';
import 'package:smart_shop_client_app/features/auth/screens/register.screen.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color iconsColor = colorScheme(context).onPrimaryContainer;
    AuthProvider authProvider = context.read<AuthProvider>();
    return BaseView(
      body: col(
        [
          LogoWidget().centered().paddingSymmetric(vertical: 48),
          Form(
            key: authProvider.formKey,
            child: col([
                cTitleSmall(
                  context,
                  AppText.email.tr.toUpperCase(),
                  fontFamily: ThemeConf.secondaryFontFamily,
                ).paddingOnly(bottom: 8),
                CInputField(
                  validator: FormBuilderValidators.email(
                    errorText: AppText.emailIsNotValide.tr,
                  ),
                  controller: authProvider.emailTextController,
                  prefixIcon: Icon(Icons.email, color: iconsColor),
                ).paddingOnly(bottom: 20),
                row([
                  cTitleSmall(
                    context,
                    AppText.password.tr.toUpperCase(),
                    fontFamily: ThemeConf.secondaryFontFamily,
                  ),
                  cTitleSmall(
                    context,
                    AppText.forgot.tr,
                    fontFamily: ThemeConf.secondaryFontFamily,
                    color: colorScheme(context).primary,
                    fontWeight: FontWeight.bold,
                  ).onTap(() {
                    Get.to(() => LoginScreen());
                  }),
                ], align: MainAxisAlignment.spaceBetween).paddingOnly(bottom: 8),
                CInputField(
                  validator: FormBuilderValidators.required(
                    errorText: AppText.passwordRequired.tr,
                  ),
                  controller: authProvider.passwordTextController,
                  prefixIcon: Icon(Icons.lock, color: iconsColor),
                  obscure: true,
                ).paddingOnly(bottom: 32),
                sel<AuthProvider, bool>(
                  (p) => p.isLoading,
                  (isLoading) => CButton.textOnly(
                    authProvider.login,
                    cTitleMedium(
                      context,
                      AppText.login.tr.toUpperCase(),
                      color: ColorsConf.textWhite,
                      fontSize: 16,
                    ),
                    loading: isLoading,
                  ).paddingOnly(bottom: 75),
                ),
              ], calign: CrossAxisAlignment.start
            ),
          ),
          AuthDevider().paddingOnly(bottom: 28),
          row([
            CButton.withIcon(
              authProvider.googleSignIn,
              cTitleMedium(
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
              cTitleMedium(
                context,
                AppText.apple.tr,
                color: colorScheme(context).onSurface,
              ),
              icon: FaIcon(
                FontAwesomeIcons.apple,
                color: colorScheme(context).onSurface,
              ),
              backgroundColor: colorScheme(context).primaryContainer,
            ).flexible(),
          ]).paddingOnly(bottom: 28),
          row([
                cTitleSmall(context, AppText.news.tr).paddingOnly(right: 4),
                cTitleSmall(
                  context,
                  AppText.createAccount.tr,
                  color: colorScheme(context).primary,
                ).onInkTap(() {
                  Get.to(RegisterScreen());
                }),
              ], align: MainAxisAlignment.center)
              .paddingOnly(bottom: 48)
              .centered(),
        ],
        calign: CrossAxisAlignment.start,
      ).paddingSymmetric(horizontal: 24).scrollVertical(),
    );
  }
}
