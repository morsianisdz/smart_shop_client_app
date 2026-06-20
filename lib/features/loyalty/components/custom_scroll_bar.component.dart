
import 'package:flutter/material.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/spacing.helper.dart';

class CustomScrollBar extends StatelessWidget {
  final double progress;

  const CustomScrollBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final double totalBarWidth = screenWith(context);
    const double thumbWidth = 180.0;

    final double maxMoveableWidth = totalBarWidth - thumbWidth;
    final double leftMargin = progress * maxMoveableWidth;

    return Container(
      width: totalBarWidth,
      height: 8,
      decoration: BoxDecoration(
        color: colorScheme(context).primaryContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: leftMargin),
        width: thumbWidth,
        height: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme(context).onSecondaryContainer,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
