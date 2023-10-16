import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/lists.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/register_screen.dart';
import 'package:flutter_ecommerce_app/widget_common/applogo_widget.dart';
import 'package:flutter_ecommerce_app/widget_common/bg_widget.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/widget_common/cus_button.dart';
import 'package:flutter_ecommerce_app/widget_common/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Login to $appname".text.fontFamily(bold).white.size(20).make(),
                15.heightBox,
                Column(
                  children: [
                    customTextField(title: email, hint: emailHint),
                    customTextField(title: password, hint: passwordHint),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black38,
                        ),
                        child: const Text(forgetPass,
                          style:  TextStyle(color: fontGrey),
                        ),
                      ),
                    ),
                    5.heightBox,
                    cusButton(onPress: () {}, color: blackColor, color2: whiteColor, textColor: whiteColor, title: login )
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                    5.heightBox,
                    RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: doNotHaveAccount,
                              style: TextStyle(color: fontGrey),
                            ),
                            TextSpan(
                              text: "$register now",
                              style: TextStyle(color: Colors.black, fontFamily: bold),
                            ),
                          ]
                        ),
                    ).onTap(() {
                      Get.to(() => const RegisterScreen());
                    }),

                    10.heightBox,
                    loginWith.text.color(fontGrey).make(),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 25,
                            child: Image.asset(socialIconList[index],width: 30,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),



              ],
            ),
          ),
    ));
  }
}
