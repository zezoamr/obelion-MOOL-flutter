import 'package:flutter/material.dart';
import 'package:flutter_mool/auth/screens/confirmcode_screen.dart';
import 'package:flutter_mool/auth/screens/signin_screen.dart';
import 'package:flutter_mool/auth/translations/translations_signup.dart';
import 'package:flutter_mool/auth/widgets/buildDropdownField.dart';
import 'package:flutter_mool/auth/widgets/buildSocialButton.dart';
import 'package:flutter_mool/auth/widgets/buildTextField.dart';

import 'package:flutter_mool/auth/widgets/dividerWithText.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = Translations.en;
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
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    translations['Create Account']!,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    translations['Start shopping now']!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SignupForm(),
            ],
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String selectedCountry = 'Select Country';

  @override
  Widget build(BuildContext context) {
    final translations = Translations.en;
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
          buildTextField(translations['First Name']!),
          buildTextField(translations['Last Name']!),
          buildTextField(translations['Email']!),
          buildDropdownField(
              context,
              translations['Country']!,
              selectedCountry,
              () =>
                  showCountrySelector(context, selectedCountry, selectCountry)),
          Row(
            children: [
              SizedBox(
                width: 80,
                child: buildTextField(translations['+971']!),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: buildTextField(translations['Mobile No.']!),
              ),
            ],
          ),
          buildTextField(translations['Password']!, isPassword: true),
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
            child: Text(translations['Sign Up']!),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(translations['Already have account?']!),
              TextButton(
                child: Text(translations['Login']!,
                    style: TextStyle(color: Colors.black)),
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
          DividerWithText(text: translations['OR']!, width: 300),
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

  void selectCountry(String country) {
    setState(() {
      selectedCountry = country;
    });
    Navigator.pop(context);
  }
}
