import 'package:flutter/material.dart';
import 'package:flutter_mool/data/SectionItem.dart';
import 'package:flutter_mool/screens/mylist_screen.dart';
import 'package:flutter_mool/screens/productlist_screen.dart';
import 'package:flutter_mool/widgets/buildNewCardItem.dart';

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductlistScreen()),
                  );
                },
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
            itemBuilder: (context, index) => buildNewCardItem(items[index]),
          ),
        ),
      ],
    );
  }
}
