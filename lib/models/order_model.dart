enum OrderStatus {
  active,
  completed,
  cancelled,
} // pending, processing, shipped, delivered, cancelled

class OrderModel {
  final String number;
  final int itemCount;
  final double totalAmount;
  final OrderStatus status;
  final DateTime date;
  final String imageUrl;

  OrderModel({
    required this.number,
    required this.itemCount,
    required this.totalAmount,
    required this.status,
    required this.date,
    required this.imageUrl,
  });

  String get statusString => status.name;
}
