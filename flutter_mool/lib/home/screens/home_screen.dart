import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_mool/home/cubits/search/search_cubit.dart';
import 'package:flutter_mool/home/data/SectionItem.dart';
import 'package:flutter_mool/home/screens/categories_screen.dart';
import 'package:flutter_mool/home/screens/discover_screen.dart';
import 'package:flutter_mool/home/screens/mylist_screen.dart';
import 'package:flutter_mool/home/screens/notifications_screen.dart';
import 'package:flutter_mool/home/screens/searchscreen.dart';
import 'package:flutter_mool/home/widgets/custom_bottomnavbar.dart';
import 'package:flutter_mool/settings/screens/myaccount_screen.dart';
import 'package:flutter_mool/shopping/screens/cart_screen.dart';

import '../widgets/delivery_banner.dart';
import '../widgets/discount_banner.dart';
import '../widgets/new_section.dart';
import '../widgets/top_brands_grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Image.asset(
          'assets/images/splash/splashtitle.png',
          width: 100,
          height: 60,
        ),
        leading: SizedBox(
          width: 1,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<
                          SearchCubit>(), // Passing the existing SearchCubit
                      child: SearchScreen(),
                    ),
                  ),
                );
              }),
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              }),
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CategoryToggle()),
              SliverToBoxAdapter(child: SizedBox(height: 5)),
              SliverToBoxAdapter(child: CategoryCards()),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(child: DeliveryBanner()),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: HorizontalScrollCards()),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: TwoCardsGrid()),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: TopBrandsGrid()),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: NewSection(
                  label: 'New Arrivals',
                  items: [
                    SectionItem(
                      title: 'Red Dress',
                      price: '2200 SAR',
                      imageAsset: 'assets/images/home/10.png',
                      discountPercentage: 20,
                      originalPrice: '2500 SAR',
                    ),
                    SectionItem(
                      title: 'Yellow dotted Dress',
                      price: '2000 SAR',
                      imageAsset: 'assets/images/home/10.png',
                    ),
                    SectionItem(
                      title: 'Blue Suit',
                      price: '1600 SAR',
                      imageAsset: 'assets/images/home/10.png',
                      discountPercentage: 15,
                      originalPrice: '3500 SAR',
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: DiscountBanner()),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: NewSection(
                  label: 'Best Sellers',
                  items: [
                    SectionItem(
                      title: 'Red Dress',
                      price: '2200 SAR',
                      imageAsset: 'assets/images/home/10.png',
                      discountPercentage: 20,
                      originalPrice: '2500 SAR',
                    ),
                    SectionItem(
                      title: 'Yellow dotted Dress',
                      price: '2000 SAR',
                      imageAsset: 'assets/images/home/10.png',
                    ),
                    SectionItem(
                      title: 'Blue Suit',
                      price: '1600 SAR',
                      imageAsset: 'assets/images/home/10.png',
                      discountPercentage: 15,
                      originalPrice: '3500 SAR',
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 90)),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(
              currentIndex: 0,
              onTap: (index) {
                switch (index) {
                  case 1:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesScreen()));
                    break;
                  case 2:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiscoverScreen()));
                    break;
                  case 3:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                    break;
                  case 4:
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyaccountScreen()));
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryToggle extends StatefulWidget {
  @override
  _CategoryToggleState createState() => _CategoryToggleState();
}

class _CategoryToggleState extends State<CategoryToggle> {
  bool isWomenSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 46, 46, 51),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton('WOMEN', isWomenSelected, () {
            setState(() => isWomenSelected = true);
          }),
          SizedBox(width: 40),
          _buildButton('MEN', !isWomenSelected, () {
            setState(() => isWomenSelected = false);
          }),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool isSelected, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class CategoryCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: Colors.transparent,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCard('SALE'),
          _buildCard('View All'),
          _buildCard('Dresses'),
          _buildCard('Tops'),
          _buildCard('Bottoms'),
          _buildCard('T-Shirts'),
        ],
      ),
    );
  }

  Widget _buildCard(String title) {
    return Container(
      width: 90,
      height: 90,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: ClipOval(
              child: Image.asset(
                'assets/images/home/17.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 400),
            autoPlayCurve: Curves.easeIn,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: [
            _buildCard('New Summer Collection 2023'),
            _buildCard('Flash Sale'),
            _buildCard('Trending Now'),
          ].map((card) {
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
          children: [0, 1, 2].map((index) {
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

  Widget _buildCard(String title) {
    return Card(
      child: Container(
        width: 300,
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              child:
                  Image.asset('assets/images/home/14.png', fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                height: 40,
                color: Colors.transparent,
                child: ElevatedButton(
                  child: Text(title, style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 87, 147, 174),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoCardsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the height of the viewport
    double viewportHeight = MediaQuery.of(context).size.height;

    return Container(
      height: viewportHeight * 0.35,
      // height: 270,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 5),
        children: [
          _buildCard('My List', context),
          _buildCard('ACCESSORIES', context),
        ],
      ),
    );
  }

  Widget _buildCard(String title, context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: AspectRatio(
              aspectRatio: 0.75, // Maintain the aspect ratio
              child:
                  Image.asset('assets/images/home/13.png', fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MylistScreen()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
