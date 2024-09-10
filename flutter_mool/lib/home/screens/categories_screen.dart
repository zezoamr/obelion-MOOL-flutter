import 'package:flutter/material.dart';
import 'package:flutter_mool/home/screens/discover_screen.dart';
import 'package:flutter_mool/home/screens/home_screen.dart';
import 'package:flutter_mool/home/widgets/custom_bottomnavbar.dart';
import 'package:flutter_mool/shopping/screens/cart_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _MyCategoriesScreenState();
}

class _MyCategoriesScreenState extends State<CategoriesScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<CategoryCard> categories = [
    CategoryCard(title: 'Tops', imageUrl: 'assets/images/home/13.png'),
    CategoryCard(title: 'Bottom', imageUrl: 'assets/images/home/13.png'),
    CategoryCard(title: 'Dresses', imageUrl: 'assets/images/home/13.png'),
    CategoryCard(title: 'Tops', imageUrl: 'assets/images/home/13.png'),
    CategoryCard(title: 'Bottom', imageUrl: 'assets/images/home/13.png'),
    CategoryCard(title: 'Dresses', imageUrl: 'assets/images/home/13.png'),
    CategoryCard(title: 'Tops', imageUrl: 'assets/images/home/13.png'),
    CategoryCard(title: 'Bottom', imageUrl: 'assets/images/home/13.png'),
    CategoryCard(title: 'Dresses', imageUrl: 'assets/images/home/13.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Handle back button press
          },
          child: Image.asset(
            'assets/images/account/arrowback.png',
            width: 24,
            height: 24,
          ),
        ),
        title: Row(
          children: [
            Text('Categories', style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: CategoryCards(categories: categories),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard {
  final String title;
  final String imageUrl;

  CategoryCard({required this.title, required this.imageUrl});
}

class CategoryCards extends StatelessWidget {
  final List<CategoryCard> categories;

  CategoryCards({required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryCard(categories[index]);
      },
    );
  }

  Widget _buildCategoryCard(CategoryCard category) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              category.imageUrl,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Text(
                  category.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
