import 'package:flutter/material.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/const/const.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
    margin: const EdgeInsets.only(top: 10, left: 20,bottom: 5),
     width: width * 0.9,
     height: height * 0.15,
     decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
     child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
        width: width * 0.3,
        height: height * 0.1,
        child: CircleAvatar(child: Image.asset(ConstImage.Rectangle56,fit: BoxFit.fill,)),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonText(text: 'Special Offers', fontWeight: FontWeight.bold, color: Colors.black, size: 25),
              Center(child: Image.asset(ConstImage.emoji))
            ],
          ),
          const Expanded(child: CommonText(text: 'We make sure you get the\noffer at best prices', fontWeight: FontWeight.normal, color: Colors.black, size: 17)),
          ],
      )
     ],),
    );
  }
}