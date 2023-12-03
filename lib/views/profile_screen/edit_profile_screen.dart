import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widget_common/bg_widget.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/widget_common/cus_button.dart';
import 'package:flutter_ecommerce_app/widget_common/custom_textfield.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx (
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [


              controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                    File(controller.profileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),


              10.heightBox,
              cusButton(
                  color: primaryYellow,
                  title: "Change",
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor),
              const Divider(),
              20.heightBox,
              customTextField(hint: nameHint, title: name, isPass: false),
              customTextField(hint: passwordHint, title: password, isPass: true),
              20.heightBox,
              SizedBox(
                  width: context.screenWidth - 60,
                  child: cusButton(color: primaryYellow, title: "Save", onPress: () {}, textColor: whiteColor)
              ),

            ],
          ).box.white.shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded.make(),
        ),
        
      ),
    );
  }
}
