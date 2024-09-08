import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mool/cubits/search/search_cubit.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mool/translations/forgot-pass-screen-translations.dart';

import 'package:flutter_mool/screens/home_screen.dart';
import 'package:flutter_mool/screens/splash_screen.dart';
import 'package:flutter_mool/screens/welcome_screen.dart';
import 'package:flutter_mool/screens/productdetails_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
        ),
        // Add other BlocProviders if needed
      ],
      child: MaterialApp(
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
        localizationsDelegates: [
          //AppLocalizations.delegate,
          ForgotPassScreenTranslations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English
          // Add other locales here
        ],
        home:
            ProductdetailsScreen(), //HomeScreen(), //WelcomeScreen(), //SplashScreen(),
      ),
    );
  }
}
