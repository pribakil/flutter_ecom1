import 'package:ecom1_frontend/models/notifation_model.dart';

class NotificationRepository {
  List<NotificationModel> getNotifications() => [
    NotificationModel(
      title: 'Order #123',
      message: 'Your order has been placed successfully.',
      type: NotificationType.order,
      time: "2 hours ago",
    ),
    NotificationModel(
      title: 'Order #456',
      message: 'Your order has been shipped.',
      type: NotificationType.delivery,
      time: "3 hours ago",
      isRead: true,
    ),
    NotificationModel(
      title: 'Promotion',
      message: 'Get 50% off on all products.',
      type: NotificationType.promo,
      time: "4 hours ago",
    ),
    NotificationModel(
      title: 'Payment',
      message: 'Your payment has been successful.',
      type: NotificationType.payment,
      time: "5 minutes ago",
      isRead: true,
    ),
  ];
}
