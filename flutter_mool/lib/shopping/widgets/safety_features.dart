import 'package:flutter/material.dart';

class SafetyFeatures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFeature(Icons.security, 'Safe packaging',
                'Orders are sanitized\nand packed'),
            Container(
              height: 80,
              child: VerticalDivider(
                width: 20,
                thickness: 2,
                color: Colors.grey[800],
              ),
            ),
            _buildFeature(Icons.repeat, 'Easy Return', '15 Days Easy Return'),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String description) {
    return Column(
      children: [
        Icon(icon, size: 32),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(description,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
