import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mool/shopping/screens/cart_screen.dart';
import 'package:flutter_mool/shopping/widgets/horizontal_scroll_cards.dart';
import 'package:flutter_mool/shopping/widgets/item_details_widget.dart';
import 'package:flutter_mool/shopping/widgets/rating_widget.dart';
import 'package:flutter_mool/shopping/widgets/reviews_buttons.dart';
import 'package:flutter_mool/shopping/widgets/reviews_widget.dart';
import 'package:flutter_mool/shopping/widgets/safety_features.dart';

class ProductdetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Elegant Blazer',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.telegram, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_bag, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              }),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalScrollCards(),
            ItemDetailsWidget(),
            RatingWidget(),
            ReviewsWidget(),
            ReviewsButtons(),
            SizedBox(height: 16),
            SafetyFeatures(),
            AddToCartButton(),
          ],
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Add to cart',
            style: TextStyle(fontSize: 16, color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
