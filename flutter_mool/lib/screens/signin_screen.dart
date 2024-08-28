import 'package:flutter/material.dart';
import 'package:flutter_mool/screens/forgot_pass_screen.dart';
import 'package:flutter_mool/screens/signup_screen.dart';

import 'package:flutter_mool/widgets/buildTextField.dart';
import 'package:flutter_mool/widgets/dividerWithText.dart';
import 'package:flutter_mool/widgets/buildSocialButton.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

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
          Column(
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
                flex: 4,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Sign in',
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
                    'Welcome !',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              SigninForm(),
            ],
          ),
        ],
      ),
    );
  }
}

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

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
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          buildTextField('Email'),
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
            onPressed: () {},
            child: const Text('Sign In'),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPassScreen()),
                );
              },
              child: Text(
                'Forget Password?',
                style: TextStyle(color: Colors.blue[300]),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account? '),
              TextButton(
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.black)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
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
