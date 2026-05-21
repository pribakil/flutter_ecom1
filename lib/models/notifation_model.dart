enum NotificationType { order, delivery, promo, payment }

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final NotificationType type;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}
