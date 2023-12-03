import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/consts/lists.dart';
import 'package:flutter_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:flutter_ecommerce_app/views/profile_screen/components/details_card.dart';
import 'package:flutter_ecommerce_app/views/profile_screen/edit_profile_screen.dart';
import 'package:flutter_ecommerce_app/widget_common/bg_widget.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [

              //EDIT PROFILE BUTTON
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.edit, color: whiteColor))
                      .onTap(() {
                        Get.to(() => const EditProfileScreen());
                      }),
              ),

              //USER DETAILS SECTION
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [

                    //AVATAR IMAGE
                    Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),

                    10.widthBox,

                    //USER NAME & EMAIL
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Dummy User".text.fontFamily(bold).size(20).white.make(),
                            "customer@example.com".text.fontFamily(semibold).white.make()
                          ],
                        )
                    ),

                    //LOGOUT BUTTON
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: whiteColor,
                            width: 2
                          )),
                        onPressed: () async {
                          await Get.put(AuthController()).logoutMethod(context);
                          Get.offAll(() => const LoginScreen());
                        },
                        child: logout.text.fontFamily(semibold).white.make(),
                    ),

                  ],
                ),
              ),

              20.heightBox,

              //DETAIL CARD SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(count: "00", title: "in your cart", width: context.screenWidth / 3.4),
                  detailsCard(count: "32", title: "in your wishlist", width: context.screenWidth / 3.4),
                  detailsCard(count: "675", title: "your orders", width: context.screenWidth / 3.4),
                ],
              ),

              //USER ACTION
              ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: Image.asset(profileButtonsIcon[index], width: 22,),
                      title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(color: lightGrey);
                  },
                  itemCount: profileButtonsList.length,
              ).box.white.rounded.shadowSm.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).make().box.color(logoYellow).make()

            ],
          ),
        ),
      )
    );
  }
}

