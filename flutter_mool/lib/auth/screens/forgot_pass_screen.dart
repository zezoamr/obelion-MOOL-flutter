import 'package:flutter/material.dart';
import 'package:flutter_mool/auth/screens/confirmcode_screen.dart';
import 'package:flutter_mool/auth/widgets/buildTextField.dart';
import 'package:flutter_mool/auth/translations/forgot-pass-screen-translations.dart';

class ForgotPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = ForgotPassScreenTranslations.of(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 46, 46, 51),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
                    t.forget,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    t.password,
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
    final t = ForgotPassScreenTranslations.of(context);

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
          buildTextField(t.emailOrMobile),
          Spacer(flex: 10),
          ElevatedButton(
            child: Text(t.submit),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConfirmCodeScreen()),
              );
            },
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
