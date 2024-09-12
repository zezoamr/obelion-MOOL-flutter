import 'package:flutter/material.dart';
import 'package:flutter_mool/shopping/widgets/rating_widget.dart';
import 'package:flutter_mool/shopping/widgets/reviews_widget.dart';

class RatingsReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Ratings And Reviews',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          RatingWidget(),
          ReviewsWidget(),
          ReviewsButtons(),
        ],
      ),
    );
  }
}

class ReviewsButtons extends StatelessWidget {
  final VoidCallback? _navigateToMoreReviews;

  ReviewsButtons({
    VoidCallback? navigateToMoreReviews,
  }) : _navigateToMoreReviews =
            navigateToMoreReviews ?? _defaultNavigateToMoreReviews;

  static void _defaultNavigateToMoreReviews() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: _navigateToMoreReviews,
          style: ButtonStyle(
            padding:
                WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
            alignment: Alignment.centerLeft,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Load More Reviews',
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
    );
  }
}
