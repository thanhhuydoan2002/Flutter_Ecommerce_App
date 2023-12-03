import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/lists.dart';
import 'package:flutter_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/register_screen.dart';
import 'package:flutter_ecommerce_app/views/home_screen/home.dart';
import 'package:flutter_ecommerce_app/widget_common/bg_widget.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/widget_common/cus_button.dart';
import 'package:flutter_ecommerce_app/widget_common/custom_textfield.dart';
import 'package:flutter_ecommerce_app/widget_common/line_with_.dart';
import 'package:get/get.dart';

import '../../widget_common/applogo_widget_sec.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());


    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                secAppLogoWidget(),
                10.heightBox,
                "Login to $appname".text.fontFamily(bold).white.size(20).make(),
                15.heightBox,
                Obx(
                  () => Column(
                    children: [
                      customTextField(title: email, hint: emailHint, isPass: false, controller: controller.emailController),
                      customTextField(title: password, hint: passwordHint, isPass: true, controller: controller.passwordController),
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
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(primaryYellow),
                          ) 
                          : cusButton(
                          onPress: () async {
                            controller.isLoading(true);

                            await controller.loginMethod(context: context).then((value) {
                              if(value != null){
                                VxToast.show(context, msg: logedin);
                                Get.offAll(() => const Home());
                              }else{
                                controller.isLoading(false);
                              }
                            });
                          },
                          color: primaryYellow,
                          textColor: whiteColor,
                          title: login )
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                      5.heightBox,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          doNotHaveAccount.text.color(fontGrey).fontFamily(bold).make(),
                          register.text.color(primaryYellow).fontFamily(bold).make().onTap(() {Get.to(() => const RegisterScreen());}),
                        ],
                      ),

                      10.heightBox,
                      const lineWithText(),
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
                ),

              ],
            ),
          ),
    ));
  }
}
