import 'package:flutter/material.dart';
import 'package:flutter_mool/screens/splash_screen.dart';
import 'package:flutter_mool/screens/welcome_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MOOL App',
      theme: ThemeData(
        primaryColor: Colors.black,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.white), //accentColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}
