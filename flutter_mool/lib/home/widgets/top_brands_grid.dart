import 'package:flutter/material.dart';

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
