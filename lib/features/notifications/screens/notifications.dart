import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop_client_app/constants/app_text.data.dart';
import 'package:smart_shop_client_app/core/helpers/colors.helper.dart';
import 'package:smart_shop_client_app/core/helpers/list_widget.helper.dart';
import 'package:smart_shop_client_app/core/helpers/text_style.helper.dart';
import 'package:smart_shop_client_app/core/widgets/base_view.component.dart';
import 'package:smart_shop_client_app/features/notifications/components/notificationItem.component.dart';
import 'package:smart_shop_client_app/features/notifications/providers/notification.provider.dart';
import 'package:smart_shop_client_app/shared/components/screen_header.component.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationProvider notificationProvider = context
        .read<NotificationProvider>();
    return BaseView(
      body: col([
        ScreenHeader(title: AppText.markAllRead.tr, leading: cTitleSmall(
            context,
            AppText.markAllRead.tr,
            color: colorScheme(context).primary,
            fontWeight: FontWeight.bold,
          )).paddingOnly(bottom: 24),

        ListView.builder(
          shrinkWrap: true,
          itemCount: notificationProvider.notifications.length,
          itemBuilder: (context, index) {
            return NotificationCard(
              item: notificationProvider.notifications[index],
            ).paddingOnly(bottom: 8);
          },
        ),
      ]).paddingSymmetric(horizontal: 16),
    );
  }
}
