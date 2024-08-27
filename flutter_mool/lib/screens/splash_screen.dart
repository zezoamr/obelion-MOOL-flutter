import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // color: Colors.black,
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Gray ellipses
              Positioned(
                top: 10,
                child: SvgPicture.asset('assets/images/splash/ellipse1.svg'),
              ),
              Positioned(
                top: 110,
                right: 0,
                child: SvgPicture.asset('assets/images/splash/ellipse2.svg'),
              ),
              // Logo
              Center(
                child: Image.asset('assets/images/splash/splashtitle.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
