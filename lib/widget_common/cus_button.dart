import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

Widget cusButton({onPress, color, color2,  textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        foregroundColor: color2,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}