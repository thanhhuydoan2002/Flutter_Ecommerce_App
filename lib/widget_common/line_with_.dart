import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/consts/consts.dart';

class lineWithText extends StatelessWidget {
  const lineWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth - 50, // Độ rộng của đường thẳng
      child: const Row(
        children: [
          Expanded(
            child: Divider(
              color: fontGrey,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('or', style: TextStyle(color: fontGrey),),
          ),

          Expanded(
            child: Divider(

              color: fontGrey,
            ),
          ),
        ],

      ),
    );
  }
}