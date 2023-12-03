import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:flutter_ecommerce_app/widget_common/applogo_widget.dart';
import 'package:get/get.dart';

import '../home_screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //SPLASH SCREEN TO LOGIN SCREEN
  changeScreen(){
    Future.delayed(const Duration(seconds: 3), () {
      //using getX
      //Get.to(() => const LoginScreen());
      auth.authStateChanges().listen((User ? user) {
        if(user == null && mounted){
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Image.asset(icSplashBg, width: 300),
            // ),
            320.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(35).color(logoYellow).make(),
            const Spacer(),
            des.text.fontFamily(semibold).size(10).white.make(),
            30.heightBox,
            //Splash Screen UI
          ],
        ),
      ),
    );
  }
}
