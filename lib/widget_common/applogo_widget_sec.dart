import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

Widget applogoWidget(){
  //using velocity X
  return Image.asset(icAppLogo).box.color(primaryYellow).size(100, 100).padding(const EdgeInsets.all(8)).rounded.make();
}