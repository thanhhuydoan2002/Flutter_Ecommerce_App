import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

Widget homeButtons({width, height, icon, String? title, onPress}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Image.asset(icon, width: 36),
       10.heightBox,
       title!.text.fontFamily(semibold).color(blackColor).make()
     ],
  ).box.rounded.white.size(width, height).make();
}