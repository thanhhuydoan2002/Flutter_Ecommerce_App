import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/splash_screen/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'consts/consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //using getX so we need to change MaterialaApp to GetMaterialApp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Centeree",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:  const AppBarTheme(
            iconTheme: IconThemeData(
                color: darkFontGrey
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}