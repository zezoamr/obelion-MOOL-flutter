import 'package:flutter/material.dart';
import 'package:flutter_mool/auth/widgets/buildDropdownField.dart';
import 'package:flutter_mool/home/screens/discover_screen.dart';
import 'package:flutter_mool/home/screens/home_screen.dart';
import 'package:flutter_mool/home/screens/mylist_screen.dart';
import 'package:flutter_mool/home/widgets/custom_bottomnavbar.dart';
import 'package:flutter_mool/settings/screens/change_password_screen.dart';
import 'package:flutter_mool/settings/screens/your_orders_screen.dart';
import 'package:flutter_mool/settings/screens/youraccount_screen.dart';
import 'package:flutter_mool/shopping/screens/cart_screen.dart';

class MyaccountScreen extends StatefulWidget {
  const MyaccountScreen({Key? key}) : super(key: key);

  @override
  State<MyaccountScreen> createState() => _MyaccountScreenState();
}

class _MyaccountScreenState extends State<MyaccountScreen> {
  int _selectedIndex = 4;
  String _selectedCountry = 'Saudi Arabia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        elevation: 0,
        title: const Text(
          'My Account',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 8),
          _buildListTile('Your Account', Icons.person_outline, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const YouraccountScreen()),
            );
          }),
          const SizedBox(height: 8),
          _buildListTile('Your Orders', Icons.local_shipping_outlined, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YourOrdersScreen()),
            );
          }),
          const SizedBox(height: 8),
          _buildListTile('My Favorite', Icons.favorite_border, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MylistScreen()),
            );
          }),
          const SizedBox(height: 8),
          _buildListTile('Address Book', Icons.location_on_outlined, () {}),
          const SizedBox(height: 8),
          _buildListTile('Change Password', Icons.lock_outline, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen()),
            );
          }),
          const SizedBox(height: 8),
          _buildListTile('Language', Icons.language, () {}),
          const SizedBox(height: 8),
          _buildCountryTile(),
          const SizedBox(height: 8),
          _buildListTile('About Us', Icons.info_outline, () {}),
          const SizedBox(height: 8),
          _buildListTile('Contact Us', Icons.message_outlined, () {}),
          const SizedBox(height: 8),
          _buildListTile('Logout', Icons.logout, () {}),
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

  Widget _buildListTile(String title, IconData icon, VoidCallback onTap) {
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
        onTap: onTap,
      ),
    );
  }

  Widget _buildCountryTile() {
    return GestureDetector(
      onTap: () =>
          showCountrySelector(context, _selectedCountry, selectCountry),
      child: Container(
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
              Image.asset(
                'assets/images/flags/${_selectedCountry.toLowerCase().replaceAll(' ', '_')}.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.black, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  void selectCountry(String country) {
    setState(() {
      _selectedCountry = country;
    });
    Navigator.pop(context);
  }
}
