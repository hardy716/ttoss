import 'notification_type.dart';

class Notification {
  final NotificationType type;
  final String description;
  final DateTime time;
  bool isRead;

  Notification(
    this.type,
    this.description,
    this.time, {
    this.isRead = false,
  });
}
