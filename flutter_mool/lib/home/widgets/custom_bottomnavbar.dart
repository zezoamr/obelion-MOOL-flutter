import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 41, 45, 50),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false, // Hide unselected labels
          showSelectedLabels: false, // Hide selected labels
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '', // No label
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Color.fromARGB(255, 51, 244, 244),
          unselectedItemColor: Colors.white,
          onTap: onTap,
        ),
      ),
    );
  }
}
