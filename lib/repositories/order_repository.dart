import 'package:ecom1_frontend/models/order_model.dart';

class OrderRepository {
  List<OrderModel> getOrders() {
    return [
      OrderModel(
        number: "ORD123456",
        itemCount: 3,
        totalAmount: 150.75,
        status: OrderStatus.completed,
        date: DateTime.now().subtract(const Duration(days: 2)),
        imageUrl: 'assets/images/shoe.jpg',
      ),
      OrderModel(
        number: "ORD654321",
        itemCount: 1,
        totalAmount: 49.99,
        status: OrderStatus.active,
        date: DateTime.now().subtract(const Duration(days: 5)),
        imageUrl: 'assets/images/laptop.jpg',
      ),
      OrderModel(
        number: "ORD652026",
        itemCount: 1,
        totalAmount: 169.99,
        status: OrderStatus.active,
        date: DateTime.now().subtract(const Duration(days: 3)),
        imageUrl: 'assets/images/laptop.jpg',
      ),
      OrderModel(
        number: "ORD987654",
        itemCount: 2,
        totalAmount: 79.99,
        status: OrderStatus.cancelled,
        date: DateTime.now().subtract(const Duration(days: 10)),
        imageUrl: 'assets/images/shoe2.jpg',
      ),
    ];
  }

  List<OrderModel> getOrdersByStatus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}
