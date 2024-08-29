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
      height: 300,
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
