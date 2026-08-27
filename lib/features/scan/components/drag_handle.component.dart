import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:velocity_x/velocity_x.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimaryContainer,
        borderRadius: BorderRadius.circular(2),
      ),
    ).centered();
  }
}
