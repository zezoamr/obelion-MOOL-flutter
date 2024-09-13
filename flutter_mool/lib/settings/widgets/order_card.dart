import 'package:flutter/material.dart';
import 'package:flutter_mool/settings/data/order_data.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order ${order.id}'),
                Text('${order.price} SAR'),
              ],
            ),
            Text('Placed On ${order.date}'),
            const SizedBox(height: 8),
            const Divider(
              height: 16,
              endIndent: 80,
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(order.productName,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildProgressIndicator(order.progress),
            const SizedBox(height: 8),
            Text(
              order.status.toString().split('.').last,
              style: TextStyle(
                color: order.status == OrderStatus.Canceled
                    ? Colors.red
                    : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (order.status == OrderStatus.Canceled)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: const [
                    Icon(Icons.error_outline, color: Colors.red, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Order canceled by vendor',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(int idx) {
    return Row(
      children: List.generate(4, (index) {
        Color color;
        if (order.status == OrderStatus.Delivered) {
          color = Colors.green;
        } else if (order.status == OrderStatus.Shipped) {
          color = index <= idx ? Colors.green : Colors.grey[300]!;
        } else if (order.status == OrderStatus.Canceled) {
          color = Colors.red;
        } else {
          color = Colors.grey[300]!;
        }
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: index < 3 ? 4 : 0),
            color: color,
          ),
        );
      }),
    );
  }
}
