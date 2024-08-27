import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/account/1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'MOOL',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Start shopping now',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              Spacer(),
              SignupForm(),
            ],
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 237, 237, 237),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5),
          _buildTextField('First Name'),
          _buildTextField('Last Name'),
          _buildTextField('Email'),
          _buildDropdownField(context, 'Country'),
          Row(
            children: [
              Container(
                width: 80,
                child: _buildTextField('+971'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _buildTextField('Mobile No.'),
              ),
            ],
          ),
          _buildTextField('Password', isPassword: true),
          ElevatedButton(
            child: Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: Size(double.infinity, 50),
            ),
            onPressed: () {},
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have account? '),
              TextButton(
                child: Text('Login', style: TextStyle(color: Colors.black)),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 5),
          DividerWithText(text: 'OR', width: 300),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(Icons.g_mobiledata),
              SizedBox(width: 20),
              _buildSocialButton(Icons.apple),
              SizedBox(width: 20),
              _buildSocialButton(Icons.facebook),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: label,
          labelStyle:
              TextStyle(color: const Color.fromARGB(255, 162, 162, 162)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 30,
        ),
        onPressed: () {},
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;
  final double width;

  DividerWithText({required this.text, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Divider(
                color: const Color.fromARGB(255, 0, 0, 0),
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text,
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            Expanded(
              child: Divider(
                color: const Color.fromARGB(255, 0, 0, 0),
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDropdownField(BuildContext context, String label) {
  return GestureDetector(
    onTap: () => showCountrySelector(context),
    child: Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    ),
  );
}

void showCountrySelector(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Country',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _countryOption('Saudi Arabia', true),
            _countryOption('UAE', false),
            _countryOption('Egypt', false),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget _countryOption(String country, bool isSelected) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      title: Text(country),
      leading: Image.asset(
        'assets/images/flags/${country.toLowerCase().replaceAll(' ', '_')}.png',
        width: 30,
        height: 20,
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.circle_outlined, color: Colors.grey),
      onTap: () {
        // Handle country selection
      },
    ),
  );
}
