import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_shop_client_app/features/notifications/enums/notification_type.enum.dart';

class NotificationItemModel {
  final int id;
  final String title;
  final String description;
  final String timestamp;
  final FaIconData icon;
  final bool isUnread;
  final NotificationType type;

  NotificationItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.icon,
    this.isUnread = false,
    required this.type
  });

  factory NotificationItemModel.fromJson(dynamic json) {
    return NotificationItemModel(
      id: json["id"],
      title: json['title'],
      description: json["description"],
      timestamp: json['timestamp'],
      icon: json['icon'],
      isUnread: json['isUnread'],
      type: NotificationType.values.firstWhere(
        (e) => e.toString() == 'NotificationType.${json['NotificationType']}',
      ),
    );
  }

  static List<NotificationItemModel> fromList(List<dynamic> list) {
    return list.map((item) => NotificationItemModel.fromJson(item)).toList();
  }
}