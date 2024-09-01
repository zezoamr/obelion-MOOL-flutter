import 'package:flutter/material.dart';
import 'package:flutter_mool/data/SectionItem.dart';
import 'package:flutter_mool/widgets/buildNewCardItem.dart';

class MylistScreen extends StatefulWidget {
  @override
  State<MylistScreen> createState() => _MylistScreenState();
}

class _MylistScreenState extends State<MylistScreen> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Row(
          children: [
            Text('My List', style: TextStyle(color: Colors.white)),
          ],
        ),
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
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategoryToggle(
            onCategorySelected: (category) {
              setState(() {
                _selectedCategory = category;
              });
            },
          )),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
              child: CardsGrid(items: [
            SectionItem(
                title: 'Elegant Blazer',
                price: '2500 SAR',
                discountPercentage: 20,
                originalPrice: '5000 SAR',
                imageAsset: 'assets/images/home/13.png'),
            SectionItem(
                title: 'Elegant Blazer',
                price: '2500 SAR',
                discountPercentage: 20,
                originalPrice: '5000 SAR',
                imageAsset: 'assets/images/home/13.png'),
            SectionItem(
                title: 'Elegant Blazer',
                price: '2500 SAR',
                discountPercentage: 20,
                originalPrice: '5000 SAR',
                imageAsset: 'assets/images/home/13.png'),
            SectionItem(
                title: 'Elegant Blazer',
                price: '2500 SAR',
                discountPercentage: 20,
                originalPrice: '5000 SAR',
                imageAsset: 'assets/images/home/13.png'),
            SectionItem(
                title: 'Elegant Blazer',
                price: '2500 SAR',
                discountPercentage: 20,
                originalPrice: '5000 SAR',
                imageAsset: 'assets/images/home/13.png'),
            SectionItem(
                title: 'Elegant Blazer',
                price: '2500 SAR',
                discountPercentage: 20,
                originalPrice: '5000 SAR',
                imageAsset: 'assets/images/home/13.png'),
            SectionItem(
                title: 'Elegant Blazer',
                price: '2500 SAR',
                discountPercentage: 20,
                originalPrice: '5000 SAR',
                imageAsset: 'assets/images/home/13.png'),
          ])),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

class CategoryToggle extends StatefulWidget {
  final Function(String) onCategorySelected;

  CategoryToggle({required this.onCategorySelected});

  @override
  _CategoryToggleState createState() => _CategoryToggleState();
}

class _CategoryToggleState extends State<CategoryToggle> {
  String _selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Tops',
    'Dress',
    'Bottoms',
    'T-Shirt',
    'Jackets',
    'Accessories',
    'Shoes',
    'Skirts',
    'Sweaters',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryButton(categories[index]);
        },
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    bool isSelected = _selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedCategory = category;
          });
          widget.onCategorySelected(category);
        },
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.grey,
          backgroundColor: isSelected ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          minimumSize: Size(100, 40),
        ),
      ),
    );
  }
}

class CardsGrid extends StatelessWidget {
  final List<SectionItem> items;

  CardsGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return buildNewCardItem(items[index]);
      },
    );
  }
}
