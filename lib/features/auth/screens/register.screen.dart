import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/state_managmenet.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/validation/app_validation.validation.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/core/widgets/button.component.dart';
import 'package:smart_shop_client_app/core/widgets/input_field.components.dart';
import 'package:smart_shop_client_app/features/auth/components/logo_widget.component.dart';
import 'package:smart_shop_client_app/features/auth/providers/auth.provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.read<AuthProvider>();
    waitBuilding(authProvider.initiate);
    Color iconsColor = colorScheme(context).onPrimaryContainer;
    
    return BaseView(
      body: Form(
        key: authProvider.registerformKey,
        child: col([
          LogoWidget().centered().paddingSymmetric(vertical: 48),
          cTitleSmall(
            context,
            AppText.username.tr.toUpperCase(),
            fontFamily: ThemeConf.secondaryFontFamily,
          ).paddingOnly(bottom: 8),
          CInputField(
            validator: FormBuilderValidators.username(
              errorText: AppText.unvalidusername.tr,
            ),
            controller: authProvider.usernameController,
            prefixIcon: Icon(Icons.person, color: iconsColor),
          ).paddingOnly(bottom: 20),
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
          cTitleSmall(
            context,
            AppText.password.tr.toUpperCase(),
            fontFamily: ThemeConf.secondaryFontFamily,
          ).paddingOnly(bottom: 8),
          CInputField(
            validator: AppValidators.password(),
            controller: authProvider.passwordTextController,
            prefixIcon: Icon(Icons.lock, color: iconsColor),
            obscure: true,
            onChanged: authProvider.onPasswordFieldChanged,
          ).paddingOnly(bottom: 32),
          cTitleSmall(
            context,
            AppText.confirmPassword.tr.toUpperCase(),
            fontFamily: ThemeConf.secondaryFontFamily,
          ).paddingOnly(bottom: 8),
          sel<AuthProvider, String>((p) => p.password, (
            password,
          ) {
            return CInputField(
              validator: AppValidators.passwordConfirmation(password),
              controller: authProvider.confirmPasswordTextController,
              prefixIcon: Icon(Icons.lock, color: iconsColor),
              obscure: true,
            ).paddingOnly(bottom: 32);
          }),
          sel<AuthProvider, bool>(
            (c) => c.isLoading,
            (isLoading) => CButton.textOnly(
              () => authProvider.register(),
              cTitleMedium(
                context,
                AppText.register.tr.toUpperCase(),
                color: ColorsConf.textWhite,
                fontSize: 16,
              ),
              loading: isLoading,
            ),
          ),
        ], calign: CrossAxisAlignment.start).paddingSymmetric(horizontal: 24).scrollVertical(),
      ),
    );
  }
}
