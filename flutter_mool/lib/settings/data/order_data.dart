enum OrderStatus { Delivered, Canceled, Shipped }

class Order {
  final String id;
  final String date;
  final String productName;
  final double price;
  final OrderStatus status;
  final int progress;

  Order({
    required this.id,
    required this.date,
    required this.productName,
    required this.price,
    required this.status,
    required this.progress,
  });
}
