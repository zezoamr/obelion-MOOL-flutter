import 'package:flutter/material.dart';

class ReviewsButtons extends StatelessWidget {
  final VoidCallback? _navigateToReviews;
  final VoidCallback? _navigateToWriteReview;

  ReviewsButtons({
    VoidCallback? navigateToReviews,
    VoidCallback? navigateToWriteReview,
  })  : _navigateToReviews = navigateToReviews ?? _defaultNavigateToReviews,
        _navigateToWriteReview =
            navigateToWriteReview ?? _defaultNavigateToWriteReview;

  static void _defaultNavigateToReviews() {}
  static void _defaultNavigateToWriteReview() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: _navigateToReviews,
              style: ButtonStyle(
                padding:
                    WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                alignment: Alignment.centerLeft,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'See all reviews',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey[600]),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(height: 1, color: Colors.grey[300]),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: _navigateToWriteReview,
              style: ButtonStyle(
                padding:
                    WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                alignment: Alignment.centerLeft,
              ),
              child: Text(
                'Write Review',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
