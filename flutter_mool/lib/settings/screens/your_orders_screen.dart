import 'package:flutter/material.dart';
import 'package:flutter_mool/settings/data/order_data.dart';
import 'package:flutter_mool/settings/widgets/order_card.dart';

class YourOrdersScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
        id: 'A255DSD5FF',
        date: 'Aug 23, 2022',
        productName: 'Elegant Blazer DARK BLA..',
        price: 25000,
        progress: 1,
        status: OrderStatus.Delivered),
    Order(
        id: 'A255DSD5FF',
        date: 'Aug 23, 2022',
        productName: 'Elegant Blazer',
        price: 25000,
        progress: 2,
        status: OrderStatus.Shipped),
    Order(
        id: 'A255DSD5FF',
        date: 'Aug 23, 2022',
        productName: 'Elegant Blazer',
        price: 25000,
        progress: 4,
        status: OrderStatus.Canceled),
  ];
  YourOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Handle back button press
          },
          child: Image.asset(
            'assets/images/account/arrowback.png',
            width: 24,
            height: 24,
          ),
        ),
        title: const Text(
          'Your orders',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search all your orders',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(
                          'Filter',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.blue),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(order: orders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
