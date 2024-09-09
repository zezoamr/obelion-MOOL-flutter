import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  final List<String> filterItems = [
    'Category',
    'Brand',
    'Price',
    'Product Rating',
    'Size',
    'Color',
  ];

  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Filter',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: filterItems.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  color: Colors.white,
                  child: ListTile(
                    title: Text(filterItems[index]),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      if (filterItems[index] == 'Size') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SizeScreen()),
                        );
                      }
                      // Handle other filter items similarly
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: const Color.fromARGB(255, 231, 231, 231),
                height: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: ElevatedButton(
                        child: Text('Reset'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Flexible(
                      flex: 2,
                      child: ElevatedButton(
                        child: Text('Apply'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: viewportHeight * 0.3),
        ],
      ),
    );
  }
}

class SizeScreen extends StatefulWidget {
  @override
  _SizeScreenState createState() => _SizeScreenState();
}

class _SizeScreenState extends State<SizeScreen> {
  List<String> sizes = [
    '10 (258)',
    '12 (258)',
    '14 (258)',
    'XL (258)',
    'S (258)'
  ];
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    double viewportHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        title: Text(
          'Size',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(sizes[index]),
                    trailing: selectedSize == sizes[index]
                        ? Icon(Icons.check, color: Colors.blue)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedSize = sizes[index];
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: const Color.fromARGB(255, 231, 231, 231),
                height: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Apply'),
              onPressed: () {
                Navigator.pop(context, selectedSize);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
          SizedBox(height: viewportHeight * 0.3),
        ],
      ),
    );
  }
}
