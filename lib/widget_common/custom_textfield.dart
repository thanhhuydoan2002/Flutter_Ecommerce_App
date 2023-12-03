import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

Widget customTextField({String? title, String? hint, controller, isPass}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title!, style: const TextStyle(
        fontFamily: semibold,
        fontSize: 18,
        color: primaryYellow,

      )),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: primaryYellow)),
        ),
      ),
      5.heightBox,
    ],
  );
}