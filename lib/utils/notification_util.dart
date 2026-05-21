import 'package:ecom1_frontend/models/notifation_model.dart';
import 'package:flutter/material.dart';

class NotificationUtil {
  static IconData getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Icons.shopping_bag_rounded; // local_shipping
      case NotificationType.delivery:
        return Icons.local_shipping_outlined; // delivery_dining
      case NotificationType.promo:
        return Icons.local_offer_rounded; // discount
      case NotificationType.payment:
        return Icons.payment_outlined; // payment
    }
  }

  static Color getIconBackgroundColor(
    BuildContext context,
    NotificationType type,
  ) {
    switch (type) {
      case NotificationType.order:
        return Theme.of(context).primaryColor.withOpacity(0.1);
      case NotificationType.delivery:
        return Colors.green[100]!;
      case NotificationType.promo:
        return Colors.red[100]!;
      case NotificationType.payment:
        return Colors.blue[100]!;
    }
  }

  static Color getIconColor(BuildContext context, NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return Theme.of(context).primaryColor;
      case NotificationType.delivery:
        return Colors.green;
      case NotificationType.promo:
        return Colors.red;
      case NotificationType.payment:
        return Colors.blue;
    }
  }
}
