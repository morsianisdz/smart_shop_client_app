import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/widgets/loading.component.dart';

class CButton {
  static Widget textOnly(
    void Function() onPress,
    Widget text, {
    bool loading = false,
    Color? backgroundColor
  }) => ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
    child: loading ? CLoading.centerCircular() : text,
  );

  static Widget withIcon(
    void Function() onPress,
    Widget text, {
    Widget? icon,
    bool loading = false,
    Color? backgroundColor
  }) => ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
    child: loading
        ? CLoading.centerCircular()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ?? const SizedBox(),
              icon != null
                  ? const SizedBox(width: UiConf.sizeBetweenContent)
                  : const SizedBox(),
              text,
            ],
          ),
  );
}
