import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

Widget applogoWidget(){
  //using velocity X
  return Image.asset(icAppLogo).box.white.size(100, 100).padding(const EdgeInsets.all(8)).rounded.make();
}