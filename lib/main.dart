import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sabka_bazaar/utils/constants/constants.dart';
import 'package:sabka_bazaar/screens/home_screen.dart';
import 'package:sabka_bazaar/screens/initial_screen.dart';
import 'package:sabka_bazaar/screens/login_screen.dart';
import 'package:sabka_bazaar/screens/signup_screen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sabka Bazaar',
        initialRoute: '/',
        routes: {
          '/': (context) => const MyApp(),
          '/inital': (context) => const InitialScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/home': (context) => const HomeScreen(),
        },
      
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  navigatePage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        settings: const RouteSettings(name: '/initial'),
        builder: (context) => const InitialScreen(),
      ),
    );
  }

//(context, '/login')
  splashMove() {
    return Timer(const Duration(seconds: 4), navigatePage);
  }

  @override
  void initState() {
    super.initState();
    splashMove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: Colors.white,
          child: const Center(
            child: Image(
              image: AssetImage(Constants.kSabkaBazaar),
              height: 140,
              width: 140,
            ),
          )),
    );
  }
}
