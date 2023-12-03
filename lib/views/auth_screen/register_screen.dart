import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/home_screen/home.dart';
import 'package:flutter_ecommerce_app/widget_common/bg_widget.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/widget_common/cus_button.dart';
import 'package:flutter_ecommerce_app/widget_common/custom_textfield.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../widget_common/applogo_widget_sec.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //TEXT CONTROLLER
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                secAppLogoWidget(),
                10.heightBox,
                "Join the $appname now".text.fontFamily(bold).white.size(20).make(),
                15.heightBox,
                Obx(
                    () => Column(
                    children: [
                      customTextField(title: name, hint: nameHint, controller: nameController, isPass: false),
                      customTextField(title: email, hint: emailHint, controller:  emailController, isPass: false),
                      customTextField(title: password, hint: passwordHint, controller:  passwordController, isPass: true),
                      customTextField(title: retypePassword, hint: passwordHint, controller: passwordRetypeController, isPass: true),
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
                            activeColor: primaryYellow,
                            checkColor: whiteColor,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            },
                          ),
                          5.widthBox,
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),

                                  TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: primaryYellow,
                                    ),
                                  ),

                                  TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    ),
                                  ),

                                  TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: primaryYellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.heightBox,
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(primaryYellow),
                          )
                          : cusButton(
                          color: isCheck == true ? primaryYellow : lightGrey,
                          textColor: whiteColor,
                          title: register,
                          onPress: () async {
                            if(isCheck != false){
                              controller.isLoading(true);

                                try{
                                  await controller
                                      .registerMethod(context: context, email: emailController.text, password: passwordController.text)
                                      .then((value) {
                                      return controller.storeUserData(
                                        email: emailController.text, password: passwordController.text, name: nameController.text);
                                  }).then((value){
                                      VxToast.show(context, msg: logedin );
                                      Get.offAll(() => const Home());
                                  });
                                } catch (e){
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isLoading(false);
                                }
                            }
                          },
                      ).box.width(context.screenWidth - 50).make(),

                      10.heightBox,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          alreadyHaveAccount.text.color(fontGrey).fontFamily(bold).make(),
                          login.text.color(primaryYellow).fontFamily(bold).make()
                              .onTap(() { Get.back();}),
                        ],
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
