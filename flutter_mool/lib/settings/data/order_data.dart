enum OrderStatus { Delivered, Canceled, Shipped }

class Order {
  final String id;
  final String date;
  final String productName;
  final double price;
  final OrderStatus status;
  final int progress;
  final String cardLastFourDigits;
  final String shippingAddress;
  final double itemsPrice;
  final double discount;
  final double vatTax;
  final double promoCodeDiscount;
  final String promoCode;

  Order({
    required this.id,
    required this.date,
    required this.productName,
    required this.price,
    required this.status,
    required this.progress,
    required this.cardLastFourDigits,
    required this.shippingAddress,
    required this.itemsPrice,
    required this.discount,
    required this.vatTax,
    required this.promoCodeDiscount,
    required this.promoCode,
  });

  double get total => itemsPrice - discount + vatTax - promoCodeDiscount;
}
