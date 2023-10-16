import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

Widget customTextField({String? title, String? hint, controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title!, style: const TextStyle(
        fontFamily: semibold,
        fontSize: 18,
        color: Colors.black87,
      )),
      5.heightBox,
      TextFormField(
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
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
        ),
      ),
      5.heightBox,
    ],
  );
}