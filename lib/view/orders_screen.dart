import 'package:ecom1_frontend/models/order_model.dart';
import 'package:ecom1_frontend/repositories/order_repository.dart';
import 'package:ecom1_frontend/utils/app_text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  final OrderRepository _orderRepository = OrderRepository();
  OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          title: Text(
            "My Orders",
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Active"),
              Tab(text: "Completed"),
              Tab(text: "Cancelled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrdersList(context, OrderStatus.active),
            _buildOrdersList(context, OrderStatus.completed),
            _buildOrdersList(context, OrderStatus.cancelled),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersList(BuildContext context, OrderStatus status) {
    final orders = _orderRepository.getOrdersByStatus(status);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) =>
          _buildOrderItem(context, orders[index], () {}),
    );
  }

  Widget _buildOrderItem(
    BuildContext context,
    OrderModel order,
    VoidCallback onViewDetails,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(order.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order # ${order.number}",
                        style: AppTextStyle.withColor(
                          AppTextStyle.h3,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${order.itemCount} items - \$${order.totalAmount.toStringAsFixed(2)}",
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodyMediumText,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ),
                      ),
                      const SizedBox(height: 8),

                      _buildStatusChip(context, order.status),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey.shade200),
          InkWell(
            onTap: onViewDetails,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "View Details",
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyMediumText,
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, OrderStatus status) {
    Color getStatusColor() {
      switch (status) {
        case OrderStatus.active:
          return Colors.blue;
        case OrderStatus.completed:
          return Colors.green;
        case OrderStatus.cancelled:
          return Colors.red;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.name.capitalize!,
        style: AppTextStyle.withColor(
          AppTextStyle.bodySmallText,
          getStatusColor(),
        ),
      ),
    );
  }
}
