import 'package:flutter/widgets.dart';
import 'package:smart_shop_client_app/constants/fake.data.dart';
import 'package:smart_shop_client_app/features/notifications/models/notifications_item.model.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationItemModel> _notifications = FakeData.notifications;
  List<NotificationItemModel> get notifications => _notifications;

  
}