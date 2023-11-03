import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';
import 'package:flutter_ecommerce_app/widget_common/cus_button.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).fontFamily(bold).make(),

        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        itemCount: 3,
                        height: 350,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),

                    10.heightBox,
                    //TITLE AND DETAILS SECTION
                    title!.text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                    10.heightBox,
                    //RATING
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true),

                    10.heightBox,
                    "\$30,000".text.color(blackColor).fontFamily(bold).size(18).make(),

                    10.heightBox,
                    Row(
                      children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands".text.fontFamily(semibold).color(darkFontGrey).size(16).make(),
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(Icons.message_rounded, color: darkFontGrey),
                        )
                      ],
                    ).box.height(60).color(textfieldGrey).padding(const EdgeInsets.symmetric(horizontal: 16)).make(),

                    //color section
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                  3,
                                      (index) => VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(Vx.randomPrimaryColor)
                                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                                          .make(),
                              ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //quantity row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                                "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)".text.color(textfieldGrey).make(),
                              ],
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //total row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [

                              ],
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),


                      ],
                    ).box.white.shadowSm.make(),

                  ],
                ),
              ),

            )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: cusButton(onPress: () {}, color: blackColor, color2: whiteColor, textColor: whiteColor, title: "Add to cart" ),
          )
        ],
      ),
    );
  }
}
