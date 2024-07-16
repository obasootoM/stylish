import 'package:flutter/material.dart';
import 'package:stylish/common/common_text.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.backgroundcolors, required this.margin});
  final String text;
  final Color textColor;
  final Color backgroundcolors;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: margin,
      width: width * 0.27,
      height: height * 0.04,
      decoration: BoxDecoration(
        color: backgroundcolors,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.5, color: Colors.white),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        CommonText(
            text: text,
            fontWeight: FontWeight.normal,
            color: textColor,
            size: 15),
        const Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
        )
      ]),
    );
  }
}
