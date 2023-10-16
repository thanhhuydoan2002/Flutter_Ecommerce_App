import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/lists.dart';
import 'package:flutter_ecommerce_app/widget_common/applogo_widget.dart';
import 'package:flutter_ecommerce_app/widget_common/bg_widget.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/widget_common/cus_button.dart';
import 'package:flutter_ecommerce_app/widget_common/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                "Join the $appname now".text.fontFamily(bold).white.size(20).make(),
                15.heightBox,
                Column(
                  children: [
                    customTextField(title: name, hint: nameHint),
                    customTextField(title: email, hint: emailHint),
                    customTextField(title: password, hint: passwordHint),
                    customTextField(title: retypePassword, hint: passwordHint),
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
                    Row(
                      children: [
                        Checkbox(
                          checkColor: blackColor,
                          value: false,
                          onChanged: (newValue) {},
                        ),
                        5.widthBox,
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: fontGrey,
                                  ),
                                ),

                                TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: blackColor,
                                  ),
                                ),

                                TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: fontGrey,
                                  ),
                                ),

                                TextSpan(
                                  text: termAndCond,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    5.heightBox,
                    cusButton(onPress: () {}, color: blackColor, color2: whiteColor, textColor: whiteColor, title: register )
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    10.heightBox,
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: alreadyHaveAccount,
                            style: TextStyle(fontFamily: bold, color: fontGrey),
                          ),
                          TextSpan(
                            text: login,
                            style: TextStyle(fontFamily: bold, color: blackColor),
                          ),
                        ]
                      ),
                    ).onTap(() {
                      Get.back();
                    }),

                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),



              ],
            ),
          ),
        ));
  }
}
