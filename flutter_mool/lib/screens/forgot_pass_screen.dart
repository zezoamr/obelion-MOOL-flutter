import 'package:flutter/material.dart';
import 'package:flutter_mool/widgets/buildTextField.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 46, 51),
      appBar: AppBar(
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Forget',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ForgotPassForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 237, 237, 237),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          buildTextField('Email or Mobile Number'),
          Spacer(flex: 10),
          ElevatedButton(
            child: Text('Submit'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
