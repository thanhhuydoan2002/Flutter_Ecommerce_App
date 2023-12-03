import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

Widget cusButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: title!.text.size(16).color(textColor).fontFamily(bold).make(),
  );
}