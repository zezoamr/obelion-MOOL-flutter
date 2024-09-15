import 'package:flutter/material.dart';
import 'package:flutter_mool/shopping/data/product_item.dart';
import 'package:flutter_mool/shopping/screens/checkout_address_screen.dart';
import 'package:flutter_mool/shopping/widgets/cart_list.dart';

class CartScreen extends StatelessWidget {
  final products = [
    ProductItem(
      name: 'Elegant Blazer',
      price: 2500,
      seller: 'ZARA',
      imageUrl: 'assets/images/home/10.png',
    ),
    ProductItem(
      name: 'Elegant Blazer',
      price: 2500,
      seller: 'ZARA',
      imageUrl: 'assets/images/home/10.png',
    ),
  ];

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SubtotalBar(subtotal: 2500),
          Expanded(
            child: CartList(products: products),
          ),
          CheckoutButton(),
        ],
      ),
    );
  }
}

class SubtotalBar extends StatelessWidget {
  final double subtotal;

  const SubtotalBar({Key? key, required this.subtotal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Subtotal',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '${subtotal.toStringAsFixed(2)} SAR',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutAddressScreen()),
          );
        },
        child: Text('Proceed to checkout'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
