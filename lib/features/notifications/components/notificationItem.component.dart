import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:smart_shop_client_app/config/colors.conf.dart';
import 'package:smart_shop_client_app/config/themes.conf.dart';
import 'package:smart_shop_client_app/config/ui.conf.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/features/notifications/enums/notification_type.enum.dart';
import 'package:smart_shop_client_app/features/notifications/models/notifications_item.model.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.item});
  final NotificationItemModel item;

  @override
  Widget build(BuildContext context) {
    late Color color;
    switch (item.type) {
      case NotificationType.success:
        color = ColorsConf.green;
      case NotificationType.wining:
        color = ColorsConf.gold;
      default:
        color = ColorsConf.gold;
    }
    return Card(
      shape: item.isUnread ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiConf.cardBorderRadius),
        side: BorderSide(color: colorScheme(context).primary, width: 0.6)) : null,
      child: Stack(
        children: [
          row([
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(child: FaIcon(item.icon, color: color, size: 26)),
            ).paddingOnly(right: 16),

            col([
              cTitleMedium(context, item.title).paddingOnly(bottom: 6),
              cTitleSmall(context, item.description).paddingOnly(bottom: 12),
              cBodyMedium(
                context,
                item.timestamp,
                fontFamily: ThemeConf.secondaryFontFamily,
              ),
            ], calign: CrossAxisAlignment.start).expand(),
          ], calign: CrossAxisAlignment.start),

          if (item.isUnread)
            Positioned(top: 10, right: 10, child: _unreadIndicatorDot(context)),
        ],
      ).p16(),
    );
  }

  Widget _unreadIndicatorDot(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: colorScheme(context).primary,
        shape: BoxShape.circle,
      ),
    );
  }
}
