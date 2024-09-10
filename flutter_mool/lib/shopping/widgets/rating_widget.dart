import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rating',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 24,
                        );
                      }),
                    ),
                    Text(
                      '3.95',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildRatingBar('5 Star', 0.5),
                    _buildRatingBar('4 Star', 0.3),
                    _buildRatingBar('3 Star', 0.1),
                    _buildRatingBar('2 Star', 0.05),
                    _buildRatingBar('1 Star', 0.05),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SizedBox(
              width: 50, child: Text(label, style: TextStyle(fontSize: 12))),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 3,
                  color: Colors.grey[200],
                ),
                FractionallySizedBox(
                  widthFactor: percentage,
                  child: Container(
                    height: 3,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          SizedBox(
            width: 30,
            child: Text(
              '${(percentage * 100).toInt()}%',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
