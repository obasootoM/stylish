import 'package:flutter/material.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/features/onboarding_screen/widget/arrow_button.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({
    super.key,  required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      width: width * 0.9,
      height: height * 0.1,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 44, 142, 223),
          borderRadius: BorderRadius.circular(10)),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                    margin: EdgeInsets.only(left: 20),
                    text: 'Deal of the Day',
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    size: 20),
                ArrowButton(
                    margin: EdgeInsets.only(top: 20, right: 10),
                    text: 'View All',
                    textColor: Colors.white,
                    backgroundcolors: Colors.transparent),
              ]),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: const Icon(Icons.timer,color: Colors.white,)),
              CommonText(
                  text:text , fontWeight: FontWeight.bold, color: Colors.white, size: 15)
            ],
          )
        ],
      ),
    );
  }
}
