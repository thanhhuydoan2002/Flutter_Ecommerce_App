import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:flutter_ecommerce_app/widget_common/applogo_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a method to change screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 3), () {
      //using getX
      Get.to(() => const LoginScreen());
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
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(35).make(),
            const Spacer(),
            des.text.fontFamily(semibold).size(10).make(),
            30.heightBox,
            //Splash Screen UI
          ],
        ),
      ),
    );
  }
}
