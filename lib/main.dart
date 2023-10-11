import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/splash_screen.dart';
import 'consts/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Centeree",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:  const AppBarTheme(backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}