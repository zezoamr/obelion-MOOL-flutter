import 'package:flutter/material.dart';
import 'package:flutter_mool/settings/data/order_data.dart';

class ShipmentDetailsCard extends StatelessWidget {
  final Order order;

  const ShipmentDetailsCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shipment details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 8),
            const Text(
              'Delivery Estimate',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Thursday, 1 September 2022 before 9pm',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildOrderItem(
              'assets/images/home/10.png',
              'Elegant Blazer with nice luxury fabric...........',
              'Zara',
              2500,
            ),
            const SizedBox(height: 16),
            _buildOrderItem(
              'assets/images/home/10.png',
              'Yellow Dress',
              'H&M',
              2000,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Track Shipment',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
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

  Widget _buildOrderItem(
      String imagePath, String name, String seller, double price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text('Sold By $seller', style: TextStyle(color: Colors.grey)),
              Text('QTY 1 x ${price.toStringAsFixed(0)}'),
              const SizedBox(height: 4),
              Text(
                'Write Review',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        Text(
          '${price.toStringAsFixed(0)} SAR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
