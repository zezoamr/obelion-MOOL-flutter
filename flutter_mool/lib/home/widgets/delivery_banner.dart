import 'package:flutter/material.dart';

class DeliveryBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20,
            height: 20,
            // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),

            child: Image.asset(
              'assets/images/home/truck.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '48 HOURS DELIVERY',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
