import 'package:flutter/material.dart';

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
        onPressed: () {},
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

class ProductItem {
  final String name;
  final double price;
  final String seller;
  final String imageUrl;

  ProductItem({
    required this.name,
    required this.price,
    required this.seller,
    required this.imageUrl,
  });
}

class CartList extends StatelessWidget {
  final List<ProductItem> products;

  const CartList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => CartCard(product: products[index]),
    );
  }
}

class CartCard extends StatelessWidget {
  final ProductItem product;

  const CartCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                product.imageUrl,
                height: 130,
                width: 130,
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.price} SAR',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Sold by: ${product.seller}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 16),
                              onPressed: () {},
                              padding: const EdgeInsets.all(4),
                            ),
                            const Text('1'),
                            IconButton(
                              icon: const Icon(Icons.add, size: 16),
                              onPressed: () {},
                              padding: const EdgeInsets.all(4),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
