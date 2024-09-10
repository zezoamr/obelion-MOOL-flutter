import 'package:flutter/material.dart';

class ReviewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reviews',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildReviewItem(),
        ],
      ),
    );
  }

  Widget _buildReviewItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.grey[600]),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nourhan Selim',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1st August 2022',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Very elegant product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'very nice and elegant product and the fabric is awsome',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
