import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mool/shopping/screens/productdetails_screen.dart';

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
