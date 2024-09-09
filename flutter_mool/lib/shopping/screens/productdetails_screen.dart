import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mool/shopping/screens/cart_screen.dart';

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

class HorizontalScrollCards extends StatefulWidget {
  @override
  _HorizontalScrollCardsState createState() => _HorizontalScrollCardsState();
}

class _HorizontalScrollCardsState extends State<HorizontalScrollCards> {
  int _currentIndex = 0;
  late List<Widget> itemlist;

  @override
  void initState() {
    super.initState();
    itemlist = [
      _buildCard(),
      _buildCard(),
      _buildCard(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.2,
            viewportFraction: 0.95,
            autoPlayCurve: Curves.easeIn,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: itemlist.map((card) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: card,
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(itemlist.length, (index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromARGB(255, 87, 147, 174)
                    : Color.fromARGB(255, 161, 161, 161),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCard({String image = 'assets/images/home/10.png'}) {
    return Card(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(image, fit: BoxFit.cover),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon:
                    Icon(Icons.favorite_border, color: Colors.black, size: 20),
                onPressed: () {},
                padding: EdgeInsets.all(4),
                constraints: BoxConstraints(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Elegant Blazer',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '2500 SAR',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ZARA', style: TextStyle(color: Colors.grey)),
              Text('VAT included', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star_half, color: Colors.amber, size: 18),
              SizedBox(width: 4),
              Text('(23)', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Return Policy', style: TextStyle(fontSize: 16)),
              Icon(Icons.chevron_right),
            ],
          ),
          SizedBox(height: 16),
          Text('Size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              _buildSizeButton('XS', true),
              SizedBox(width: 8),
              _buildSizeButton('S', false),
              SizedBox(width: 8),
              _buildSizeButton('L', false),
              SizedBox(width: 8),
              _buildSizeButton('XL', false),
            ],
          ),
          SizedBox(height: 16),
          Text('Color',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              _buildColorButton(Color(0xFFFAD7BD)),
              SizedBox(width: 8),
              _buildColorButton(Color(0xFF8B4513)),
              SizedBox(width: 8),
              _buildColorButton(Colors.black),
              SizedBox(width: 8),
              _buildColorButton(Colors.white),
            ],
          ),
          SizedBox(height: 16),
          Text('Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'ZARA elegant Two-Button Fitted Blazer for Women ZARA 2elegant2 Two-Button 2Fitted Blazer f2or Women',
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 16),
          Text('Product Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildProductDetailsSection(),
        ],
      ),
    );
  }

  Widget _buildSizeButton(String label, bool isSelected) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
    );
  }

  Widget _buildProductDetailsSection() {
    final details = [
      ['Product Code', '458754485'],
      ['Brand', 'Zara'],
      ['Fabric', 'Cotton'],
      ['Model wearing size', 'S'],
      ['Shape', 'Tiered'],
    ];

    return Column(
      children: [
        for (int i = 0; i < details.length; i += 2)
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: _buildProductDetailItem(details[i][0], details[i][1]),
                ),
                if (i + 1 < details.length) ...[
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildProductDetailItem(
                        details[i + 1][0], details[i + 1][1]),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildProductDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

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

class ReviewsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
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
              onPressed: () {},
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
