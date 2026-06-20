import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';

extension AppValidators on FormBuilderValidators {
  static FormFieldValidator<String> password() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: AppText.passwordRequired.tr),
      FormBuilderValidators.minLength(
        8,
        errorText: AppText.passwordTooShort.tr,
      ),
      FormBuilderValidators.match(
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
        errorText: AppText.invalidPassword.tr,
      ),
    ]);
  }

  static FormFieldValidator<String> passwordConfirmation(String password) {
    return FormBuilderValidators.compose([
      (value) {
        if (value != password) {
          return AppText.passwordsDoNotMatch.tr;
        }
        return null;
      },
    ]);
  }
}
