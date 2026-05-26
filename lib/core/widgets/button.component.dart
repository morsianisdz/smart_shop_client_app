import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/widgets/loading.component.dart';
import 'package:velocity_x/velocity_x.dart';

class CButton extends StatelessWidget {
  final Widget text;
  final void Function() onPress;
  final Widget? icon;
  final bool loading;
  final Color? color;

  const CButton(this.text, this.onPress,
      {super.key, this.icon, this.loading = false, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPress,
      child: loading
          ? CLoading.centerCircular()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                text, // Text
                icon != null
                    ? const SizedBox(width: UiConf.sizeBetweenContent)
                    : const SizedBox(),
                icon ?? const SizedBox(),
              ],
            ),
    );
  }
}

class CTextButton extends StatelessWidget {
  final Widget text;
  final void Function() onPress;
  final bool loading;

  const CTextButton(this.text, this.onPress, {super.key, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return loading
        ? CLoading.centerCircular()
        : text.onTap(loading ? () {} : onPress);
  }
}
