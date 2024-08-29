import 'package:flutter/material.dart';
import 'package:flutter_mool/widgets/custom_bottomnavbar.dart';

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
        actions: [
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {}),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategoryToggle()),
          SliverToBoxAdapter(child: SizedBox(height: 5)),
          SliverToBoxAdapter(child: CategoryCards()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: DeliveryBanner()),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
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
          SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
          ElevatedButton(
            child: Text('WOMEN', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 46, 46, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(
                  color: isWomenSelected ? Colors.white : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            onPressed: () {
              setState(() {
                isWomenSelected = true;
              });
            },
          ),
          SizedBox(width: 40),
          ElevatedButton(
            child: Text('MEN', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 46, 46, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(
                  color: !isWomenSelected ? Colors.white : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            onPressed: () {
              setState(() {
                isWomenSelected = false;
              });
            },
          ),
        ],
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

class HorizontalScrollCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCard('New Summer Collection 2023'),
          _buildCard('Flash Sale'),
          _buildCard('Trending Now'),
        ],
      ),
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
                borderRadius: BorderRadius.circular(12)),
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
    return Container(
      height: 350,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 5),
        children: [
          _buildCard('VACATION WEAR'),
          _buildCard('ACCESSORIES'),
        ],
      ),
    );
  }

  Widget _buildCard(String title) {
    return Card(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset('assets/images/home/13.png', fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 30,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              // color: Colors.black.withOpacity(0.5),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBrandsGrid extends StatelessWidget {
  final List<String> brands = [
    'CHANEL',
    'ZARA',
    'adidas',
    'Levi\'s',
    'NIKE',
    'LOFT',
    'DIOR',
    'H&M',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: const Color.fromARGB(204, 241, 236, 184),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Brands',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Center(
                  child: Image.asset('assets/images/home/12.jpg',
                      fit: BoxFit.cover),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NewSection extends StatelessWidget {
  final String label;
  final List<SectionItem> items;

  NewSection({required this.label, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All >',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 130, 130, 130),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 350,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) => _buildNewItem(items[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildNewItem(SectionItem item) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ),
                if (item.discountPercentage != null)
                  Positioned(
                    top: 8,
                    left: 0,
                    child: Container(
                      width: 50,
                      padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        '${item.discountPercentage}%',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(item.title, style: TextStyle(fontSize: 16)),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (item.originalPrice != null)
                      Text(
                        item.originalPrice!,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                      ),
                    SizedBox(width: 5),
                    Text(item.price,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Get up to 15% off with code : ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'GET15',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

class SectionItem {
  final String title;
  final String price;
  final String imageAsset;
  final int? discountPercentage;
  final String? originalPrice;

  SectionItem({
    required this.title,
    required this.price,
    required this.imageAsset,
    this.discountPercentage,
    this.originalPrice,
  });
}
