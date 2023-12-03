import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

Widget secAppLogoWidget(){
  //using velocity X
  return Image.asset(icAppLogo2).box.white.size(100, 100).padding(const EdgeInsets.all(8)).rounded.make();
}