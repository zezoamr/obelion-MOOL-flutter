import 'package:flutter/material.dart';
import 'package:flutter_mool/screens/confirmcode_screen.dart';
import 'package:flutter_mool/screens/signin_screen.dart';

import 'package:flutter_mool/widgets/buildTextField.dart';
import 'package:flutter_mool/widgets/dividerWithText.dart';
import 'package:flutter_mool/widgets/buildDropdownField.dart';
import 'package:flutter_mool/widgets/buildSocialButton.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
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
                title: Image.asset(
                  'assets/images/splash/splashtitle.png',
                  width: 100,
                  height: 60,
                ),
                centerTitle: true,
              ),
              const Spacer(
                flex: 3,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Start shopping now',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const SignupForm(),
            ],
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 237, 237, 237),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          buildTextField('First Name'),
          buildTextField('Last Name'),
          buildTextField('Email'),
          buildDropdownField(context, 'Country'),
          Row(
            children: [
              SizedBox(
                width: 80,
                child: buildTextField('+971'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: buildTextField('Mobile No.'),
              ),
            ],
          ),
          buildTextField('Password', isPassword: true),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConfirmCodeScreen()),
              );
            },
            child: const Text('Sign Up'),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have account? '),
              TextButton(
                child:
                    const Text('Login', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SigninScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          DividerWithText(text: 'OR', width: 300),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialButton(Icons.g_mobiledata),
              const SizedBox(width: 20),
              buildSocialButton(Icons.apple),
              const SizedBox(width: 20),
              buildSocialButton(Icons.facebook),
            ],
          ),
        ],
      ),
    );
  }
}
