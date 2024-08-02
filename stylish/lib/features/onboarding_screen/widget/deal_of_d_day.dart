import 'package:flutter/material.dart';
import 'package:stylish/common/common_text.dart';
import 'package:stylish/features/onboarding_screen/widget/arrow_button.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({
    super.key,
    required this.text,
    required this.dealText,
    required this.backgroundColor, 
    required this.icon,
  });
  final String text;
  final String dealText;
  final Color backgroundColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      width: width * 0.9,
      height: height * 0.11,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                    margin: const EdgeInsets.only(left: 20),
                    text: dealText,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    size: 20),
                const SizedBox(
                  height: 10,
                ),
                ArrowButton(
                    margin: const EdgeInsets.only(top: 23, right: 10),
                    widths: width * 0.32,
                    text: 'View All',
                    textColor: Colors.white,
                    backgroundcolors: Colors.transparent),
              ]),
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  )),
              CommonText(
                  text: text,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  size: 15)
            ],
          )
        ],
      ),
    );
  }
}
