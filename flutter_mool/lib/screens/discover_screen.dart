import 'package:flutter/material.dart';
import 'package:flutter_mool/data/SectionItem.dart';
import 'package:flutter_mool/widgets/buildNewCardItem.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Row(
          children: [
            Text('Discover', style: TextStyle(color: Colors.white)),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/images/account/arrowback.png',
            width: 24,
            height: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background GIF
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home/13.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom overlay with text
          Positioned(
            left: 0,
            right: 60,
            bottom: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.transparent,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/home/13.png'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sara Essam',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'New sweat shirts that glow the winter',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Vertically stacked buttons on the right
          Positioned(
            right: 10,
            bottom: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCircularButton(Icons.shopping_bag_outlined, 'Products',
                    () {
                  _showProductsBottomSheet(context);
                }),
                SizedBox(height: 30),
                _buildCircularButton(Icons.grid_view, 'Grid', () {}),
                SizedBox(height: 30),
                _buildCircularButton(
                    Icons.messenger_outline, 'Whatsapp', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton(
      IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.black),
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  void _showProductsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 0.95,
          builder: (_, controller) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Products',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      controller: controller,
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return buildNewCardItem(
                          SectionItem(
                            title: 'Red Dress',
                            price: '2200 SAR',
                            imageAsset: 'assets/images/home/10.png',
                            discountPercentage: 20,
                            originalPrice: '2500 SAR',
                          ),
                          givewidth: 60,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
