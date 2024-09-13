import 'package:flutter/material.dart';
import 'package:flutter_mool/home/screens/discover_screen.dart';
import 'package:flutter_mool/home/screens/home_screen.dart';
import 'package:flutter_mool/home/widgets/custom_bottomnavbar.dart';
import 'package:flutter_mool/shopping/screens/cart_screen.dart';

class MyaccountScreen extends StatefulWidget {
  const MyaccountScreen({Key? key}) : super(key: key);

  @override
  State<MyaccountScreen> createState() => _MyaccountScreenState();
}

class _MyaccountScreenState extends State<MyaccountScreen> {
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 213, 213),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        elevation: 0,
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
        title: const Text(
          'My Account',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 8),
          _buildListTile('Your Account', Icons.person_outline),
          const SizedBox(height: 8),
          _buildListTile('Your Orders', Icons.local_shipping_outlined),
          const SizedBox(height: 8),
          _buildListTile('My Favorite', Icons.favorite_border),
          const SizedBox(height: 8),
          _buildListTile('Address Book', Icons.location_on_outlined),
          const SizedBox(height: 8),
          _buildListTile('Change Password', Icons.lock_outline),
          const SizedBox(height: 8),
          _buildListTile('Language', Icons.language),
          const SizedBox(height: 8),
          _buildCountryTile(),
          const SizedBox(height: 8),
          _buildListTile('About Us', Icons.info_outline),
          const SizedBox(height: 8),
          _buildListTile('Contact Us', Icons.message_outlined),
          const SizedBox(height: 8),
          _buildListTile('Logout', Icons.logout),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DiscoverScreen()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
              break;
          }
        },
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        trailing:
            const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
      ),
    );
  }

  Widget _buildCountryTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const Icon(Icons.public, color: Colors.black),
        title: const Text('Country', style: TextStyle(color: Colors.black)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/flags/saudi_arabia.png',
                width: 24, height: 24),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
          ],
        ),
      ),
    );
  }
}
